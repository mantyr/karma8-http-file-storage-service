package test

import (
	"fmt"
	"testing"

	"github.com/mantyr/karma8-http-file-storage-service/internal/id"
	"github.com/mantyr/karma8-http-file-storage-service/internal/id/subjects"
	"github.com/mantyr/karma8-http-file-storage-service/internal/storages"
	"github.com/mantyr/karma8-http-file-storage-service/internal/storages/namespaces"

	. "github.com/smartystreets/goconvey/convey" //nolint:golint,stylecheck
)

func Run(t *testing.T, st namespaces.Storage) {
	err := st.Flush(t)
	So(err, ShouldBeNil)

	namespaceID, err := id.GenerateNamespaceID()
	So(err, ShouldBeNil)
	So(namespaceID.IsZero(), ShouldEqual, false)

	creatorID, err := id.GenerateSubjectID()
	So(err, ShouldBeNil)
	So(creatorID.IsZero(), ShouldEqual, false)

	updaterID, err := id.GenerateSubjectID()
	So(err, ShouldBeNil)
	So(updaterID.IsZero(), ShouldEqual, false)
	So(updaterID.String(), ShouldNotEqual, creatorID.String())

	namespace := &namespaces.Namespace{
		NamespaceID: namespaceID,
		Enabled:  true,
		Creator:  id.Subject{ID: creatorID, Type: "user"},
		Updater:  id.Subject{ID: updaterID, Type: "user"},
	}

	Convey("Добавляем пространство для файлов", func() {
		err = st.Add(namespace)
		So(err, ShouldBeNil)
		Convey("Проверяем что в бд сохранился пространство для файлов", func() {
			result, err := st.Get(namespaceID)
			So(err, ShouldBeNil)
			So(result, ShouldNotBeNil)
			Convey("Проверяем что проставилась дата создания и обновления", func() {
				So(result.CreatedAt.IsZero(), ShouldEqual, false)
				So(result.UpdatedAt.IsZero(), ShouldEqual, false)
				So(result.CreatedAt.UnixNano(), ShouldEqual, result.UpdatedAt.UnixNano())
			})
			checkNamespaces(
				"Проверяем значение основных параметров",
				result,
				namespace,
			)
			Convey("Проверяем что пространство нельзя создать повторно", func() {
				err = st.Add(namespace)
				So(err, ShouldNotBeNil)
				So(storages.CheckExists(err), ShouldEqual, true)
				So(storages.CheckNotFound(err), ShouldEqual, false)
				So(err.Error(), ShouldNotEqual, "")
			})
			Convey("Проверяем удаление пространства", func() {
				err := st.Delete(namespaceID, id.Subject{ID: updaterID, Type: subjects.User})
				So(err, ShouldBeNil)
				So(storages.CheckNotFound(err), ShouldEqual, false)
				So(storages.CheckExists(err), ShouldEqual, false)
				result, err := st.Get(namespaceID)
				So(result, ShouldBeNil)
				So(err, ShouldNotBeNil)
				So(storages.CheckNotFound(err), ShouldEqual, true)
				So(storages.CheckExists(err), ShouldEqual, false)
				So(err.Error(), ShouldEqual, fmt.Sprintf("namespace not found (%s)", namespaceID.String()))
			})
		})
	})
	Convey("Проверяем что нельзя получить не существующее пространство", func() {
		result, err := st.Get(namespaceID)
		So(err, ShouldNotBeNil)
		So(result, ShouldBeNil)
		So(storages.CheckNotFound(err), ShouldEqual, true)
		So(storages.CheckExists(err), ShouldEqual, false)
		So(
			err.Error(),
			ShouldEqual,
			fmt.Sprintf("namespace not found (%s)", namespaceID.String()),
		)
	})
	Convey("Проверяем что нельзя получить пространство по пустому идентификатору", func() {
		result, err := st.Get(id.NamespaceID{})
		So(err, ShouldNotBeNil)
		So(result, ShouldBeNil)
		So(storages.CheckNotFound(err), ShouldEqual, false)
		So(storages.CheckExists(err), ShouldEqual, false)
		So(err.Error(), ShouldEqual, "empty namespaceID")
	})
	Convey("Проверяем что нельзя удалить не существующее пространство", func() {
		err := st.Delete(namespaceID, id.Subject{ID: updaterID, Type: subjects.User})
		So(err, ShouldNotBeNil)
		So(storages.CheckNotFound(err), ShouldEqual, true)
		So(storages.CheckExists(err), ShouldEqual, false)
		So(err.Error(), ShouldEqual, fmt.Sprintf("delete namespace error: namespace not found (%s)", namespaceID.String()))
	})
	Convey("Проверяем что нельзя удалить пространство по пустому идентификатору", func() {
		err := st.Delete(id.NamespaceID{}, id.Subject{ID: updaterID, Type: subjects.User})
		So(err, ShouldNotBeNil)
		So(storages.CheckNotFound(err), ShouldEqual, false)
		So(storages.CheckExists(err), ShouldEqual, false)
		So(err.Error(), ShouldEqual, "empty namespaceID")
	})
}

func checkNamespaces(
	title string,
	result *namespaces.Namespace,
	namespace *namespaces.Namespace,
) {
	Convey(title, func() {
		So(result, ShouldNotBeNil)
		Convey("NamespaceID", func() {
			So(result.NamespaceID.String(), ShouldEqual, namespace.NamespaceID.String())
		})
		Convey("Enabled", func() {
			So(result.Enabled, ShouldEqual, namespace.Enabled)
		})
		Convey("CreatorID", func() {
			So(result.Creator.ID.String(), ShouldEqual, namespace.Creator.ID.String())
		})
		Convey("UpdaterID", func() {
			So(result.Updater.ID.String(), ShouldEqual, namespace.Updater.ID.String())
		})
	})
}
