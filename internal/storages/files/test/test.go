package test

import (
	"fmt"
	"testing"

	"github.com/mantyr/karma8-http-file-storage-service/internal/id"
	"github.com/mantyr/karma8-http-file-storage-service/internal/id/subjects"
	"github.com/mantyr/karma8-http-file-storage-service/internal/storages"
	"github.com/mantyr/karma8-http-file-storage-service/internal/storages/files"

	. "github.com/smartystreets/goconvey/convey" //nolint:golint,stylecheck
)

func Run(t *testing.T, st files.Storage) {
	err := st.Flush(t)
	So(err, ShouldBeNil)

	namespaceID, err := id.GenerateNamespaceID()
	So(err, ShouldBeNil)
	So(namespaceID.IsZero(), ShouldEqual, false)

	fileID, err := id.GenerateFileID()
	So(err, ShouldBeNil)
	So(fileID.IsZero(), ShouldEqual, false)

	creatorID, err := id.GenerateSubjectID()
	So(err, ShouldBeNil)
	So(creatorID.IsZero(), ShouldEqual, false)

	updaterID, err := id.GenerateSubjectID()
	So(err, ShouldBeNil)
	So(updaterID.IsZero(), ShouldEqual, false)
	So(updaterID.String(), ShouldNotEqual, creatorID.String())

	serverID1, err := id.GenerateServerID()
	So(err, ShouldBeNil)
	So(serverID1.IsZero(), ShouldEqual, false)

	serverID2, err := id.GenerateServerID()
	So(err, ShouldBeNil)
	So(serverID2.IsZero(), ShouldEqual, false)

	serverID3, err := id.GenerateServerID()
	So(err, ShouldBeNil)
	So(serverID3.IsZero(), ShouldEqual, false)

	file := &files.File{
		NamespaceID: namespaceID,
		FileID:      fileID,
		Name:        "path/file.txt",
		Enabled:     true,
		Finished:    true,
		Size:        10,
		Servers: []id.ServerID{
			serverID1,
			serverID2,
			serverID3,
		},
		Creator: id.Subject{ID: creatorID, Type: "user"},
		Updater: id.Subject{ID: updaterID, Type: "user"},
	}

	Convey("Добавляем информацию о файле", func() {
		err = st.Add(file)
		So(err, ShouldBeNil)
		Convey("Проверяем что в бд сохранилась информация о файле", func() {
			result, err := st.Get(namespaceID, fileID)
			So(err, ShouldBeNil)
			So(result, ShouldNotBeNil)
			Convey("Проверяем что проставилась дата создания и обновления", func() {
				So(result.CreatedAt.IsZero(), ShouldEqual, false)
				So(result.UpdatedAt.IsZero(), ShouldEqual, false)
				So(result.CreatedAt.UnixNano(), ShouldEqual, result.UpdatedAt.UnixNano())
			})
			checkFiles(
				"Проверяем значение основных параметров",
				result,
				file,
			)
			Convey("Проверяем что файл нельзя создать повторно", func() {
				err = st.Add(file)
				So(err, ShouldNotBeNil)
				So(storages.CheckExists(err), ShouldEqual, true)
				So(storages.CheckNotFound(err), ShouldEqual, false)
				So(err.Error(), ShouldNotEqual, "")
			})
			Convey("Проверяем удаление файла", func() {
				err := st.Delete(namespaceID, fileID, id.Subject{ID: updaterID, Type: subjects.User})
				So(err, ShouldBeNil)
				So(storages.CheckNotFound(err), ShouldEqual, false)
				So(storages.CheckExists(err), ShouldEqual, false)
				result, err := st.Get(namespaceID, fileID)
				So(result, ShouldBeNil)
				So(err, ShouldNotBeNil)
				So(storages.CheckNotFound(err), ShouldEqual, true)
				So(storages.CheckExists(err), ShouldEqual, false)
				So(
					err.Error(),
					ShouldEqual,
					fmt.Sprintf(
						"file not found (namespace_id=%s, file_id=%s)",
						namespaceID.String(),
						fileID.String(),
					),
				)
			})
		})
	})
	Convey("Проверяем установку статуса", func() {
		err = st.Add(file)
		So(err, ShouldBeNil)
		Convey("enable уже в активном файле", func() {
			err := st.Enable(namespaceID, fileID, id.Subject{ID: updaterID, Type: subjects.User})
			So(err, ShouldBeNil)
			result, err := st.Get(namespaceID, fileID)
			So(result, ShouldNotBeNil)
			So(err, ShouldBeNil)
			So(result.Enabled, ShouldBeTrue)
			So(result.CreatedAt.UnixNano(), ShouldNotEqual, result.UpdatedAt.UnixNano())
		})
		Convey("enabled от другого пользователя", func() {
			updaterID, _ := id.GenerateSubjectID()
			err := st.Enable(namespaceID, fileID, id.Subject{ID: updaterID, Type: subjects.User})
			So(err, ShouldBeNil)
			result, err := st.Get(namespaceID, fileID)
			So(result, ShouldNotBeNil)
			So(err, ShouldBeNil)
			So(result.Enabled, ShouldBeTrue)
			So(result.Updater.ID.String(), ShouldEqual, updaterID.String())
		})
		Convey("disable", func() {
			updaterID, _ := id.GenerateSubjectID()
			err := st.Disable(namespaceID, fileID, id.Subject{ID: updaterID, Type: subjects.User})
			So(err, ShouldBeNil)
			result, err := st.Get(namespaceID, fileID)
			So(result, ShouldNotBeNil)
			So(err, ShouldBeNil)
			So(result.Enabled, ShouldBeFalse)
			So(result.Updater.ID.String(), ShouldEqual, updaterID.String())
			Convey("disable уже выключенного плагина", func() {
				updaterID, _ := id.GenerateSubjectID()
				err := st.Disable(namespaceID, fileID, id.Subject{ID: updaterID, Type: subjects.User})
				So(err, ShouldBeNil)
				result, err := st.Get(namespaceID, fileID)
				So(result, ShouldNotBeNil)
				So(err, ShouldBeNil)
				So(result.Enabled, ShouldBeFalse)
				So(result.Updater.ID.String(), ShouldEqual, updaterID.String())
			})
			Convey("enable - включаем повторно", func() {
				err := st.Enable(namespaceID, fileID, id.Subject{ID: updaterID, Type: subjects.User})
				So(err, ShouldBeNil)
				result, err := st.Get(namespaceID, fileID)
				So(result, ShouldNotBeNil)
				So(err, ShouldBeNil)
				So(result.Enabled, ShouldBeTrue)
				So(result.CreatedAt.UnixNano(), ShouldNotEqual, result.UpdatedAt.UnixNano())
			})
		})
	})
	Convey("Проверяем финализацию файла", func() {
		err = st.Add(file)
		So(err, ShouldBeNil)
		Convey("finish уже в финальном файле", func() {
			err := st.Finish(namespaceID, fileID, 1000, id.Subject{ID: updaterID, Type: subjects.User})
			So(err, ShouldBeNil)
			result, err := st.Get(namespaceID, fileID)
			So(result, ShouldNotBeNil)
			So(err, ShouldBeNil)
			So(result.Finished, ShouldBeTrue)
			So(result.Size, ShouldEqual, int64(1000))
			So(result.CreatedAt.UnixNano(), ShouldNotEqual, result.UpdatedAt.UnixNano())
		})
		Convey("noFinish уже в финальном файле", func() {
			err := st.NoFinish(namespaceID, fileID, id.Subject{ID: updaterID, Type: subjects.User})
			So(err, ShouldBeNil)
			result, err := st.Get(namespaceID, fileID)
			So(result, ShouldNotBeNil)
			So(err, ShouldBeNil)
			So(result.Finished, ShouldBeFalse)
			So(result.Size, ShouldEqual, int64(0))
			So(result.CreatedAt.UnixNano(), ShouldNotEqual, result.UpdatedAt.UnixNano())
			Convey("finish", func() {
				err := st.Finish(namespaceID, fileID, 1000, id.Subject{ID: updaterID, Type: subjects.User})
				So(err, ShouldBeNil)
				result, err := st.Get(namespaceID, fileID)
				So(result, ShouldNotBeNil)
				So(err, ShouldBeNil)
				So(result.Finished, ShouldBeTrue)
				So(result.Size, ShouldEqual, int64(1000))
				So(result.CreatedAt.UnixNano(), ShouldNotEqual, result.UpdatedAt.UnixNano())
			})
		})
	})
	Convey("Проверяем что нельзя получить не существующий файл", func() {
		result, err := st.Get(namespaceID, fileID)
		So(err, ShouldNotBeNil)
		So(result, ShouldBeNil)
		So(storages.CheckNotFound(err), ShouldEqual, true)
		So(storages.CheckExists(err), ShouldEqual, false)
		So(
			err.Error(),
			ShouldEqual,
			fmt.Sprintf(
				"file not found (namespace_id=%s, file_id=%s)",
				namespaceID.String(),
				fileID.String(),
			),
		)
	})
	Convey("Проверяем что нельзя получить файл по пустому идентификатору", func() {
		result, err := st.Get(namespaceID, id.FileID{})
		So(err, ShouldNotBeNil)
		So(result, ShouldBeNil)
		So(storages.CheckNotFound(err), ShouldEqual, false)
		So(storages.CheckExists(err), ShouldEqual, false)
		So(err.Error(), ShouldEqual, "empty fileID")
	})
	Convey("Проверяем что нельзя удалить не существующей файл", func() {
		err := st.Delete(namespaceID, fileID, id.Subject{ID: updaterID, Type: subjects.User})
		So(err, ShouldNotBeNil)
		So(storages.CheckNotFound(err), ShouldEqual, true)
		So(storages.CheckExists(err), ShouldEqual, false)
		So(
			err.Error(),
			ShouldEqual,
			fmt.Sprintf(
				"delete file error: file not found (namespace_id=%s, file_id=%s)",
				namespaceID.String(),
				fileID.String(),
			),
		)
	})
	Convey("Проверяем что нельзя удалить файл по пустому идентификатору", func() {
		err := st.Delete(namespaceID, id.FileID{}, id.Subject{ID: updaterID, Type: subjects.User})
		So(err, ShouldNotBeNil)
		So(storages.CheckNotFound(err), ShouldEqual, false)
		So(storages.CheckExists(err), ShouldEqual, false)
		So(err.Error(), ShouldEqual, "empty fileID")
	})
}

func checkFiles(
	title string,
	result *files.File,
	file *files.File,
) {
	Convey(title, func() {
		So(result, ShouldNotBeNil)
		Convey("FileID", func() {
			So(result.FileID.String(), ShouldEqual, file.FileID.String())
		})
		Convey("Name", func() {
			So(result.Name, ShouldEqual, file.Name)
		})
		Convey("Enabled", func() {
			So(result.Enabled, ShouldEqual, file.Enabled)
		})
		Convey("Finished", func() {
			So(result.Finished, ShouldEqual, file.Finished)
		})
		Convey("Size", func() {
			So(result.Size, ShouldEqual, file.Size)
		})
		Convey("Servers", func() {
			So(result.Servers, ShouldResemble, file.Servers)
		})
		Convey("CreatorID", func() {
			So(result.Creator.ID.String(), ShouldEqual, file.Creator.ID.String())
		})
		Convey("UpdaterID", func() {
			So(result.Updater.ID.String(), ShouldEqual, file.Updater.ID.String())
		})
	})
}
