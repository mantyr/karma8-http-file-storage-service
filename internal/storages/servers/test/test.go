package test

import (
	"fmt"
	"testing"

	"github.com/mantyr/karma8-http-file-storage-service/internal/id"
	"github.com/mantyr/karma8-http-file-storage-service/internal/id/subjects"
	"github.com/mantyr/karma8-http-file-storage-service/internal/storages"
	"github.com/mantyr/karma8-http-file-storage-service/internal/storages/servers"

	. "github.com/smartystreets/goconvey/convey" //nolint:golint,stylecheck
)

func GenerateServer() *servers.Server {
	serverID, err := id.GenerateServerID()
	So(err, ShouldBeNil)
	So(serverID.IsZero(), ShouldEqual, false)

	creatorID, err := id.GenerateSubjectID()
	So(err, ShouldBeNil)
	So(creatorID.IsZero(), ShouldEqual, false)

	updaterID, err := id.GenerateSubjectID()
	So(err, ShouldBeNil)
	So(updaterID.IsZero(), ShouldEqual, false)
	So(updaterID.String(), ShouldNotEqual, creatorID.String())

	return &servers.Server{
		ServerID: serverID,
		Host:     "localhost",
		Port:     9000,
		Creator:  id.Subject{ID: creatorID, Type: "user"},
		Updater:  id.Subject{ID: updaterID, Type: "user"},
	}
}

func Run(t *testing.T, st servers.Storage) {
	err := st.Flush(t)
	So(err, ShouldBeNil)

	serverID, err := id.GenerateServerID()
	So(err, ShouldBeNil)
	So(serverID.IsZero(), ShouldEqual, false)

	creatorID, err := id.GenerateSubjectID()
	So(err, ShouldBeNil)
	So(creatorID.IsZero(), ShouldEqual, false)

	updaterID, err := id.GenerateSubjectID()
	So(err, ShouldBeNil)
	So(updaterID.IsZero(), ShouldEqual, false)
	So(updaterID.String(), ShouldNotEqual, creatorID.String())

	server := &servers.Server{
		ServerID: serverID,
		Host:     "localhost",
		Port:     9000,
		Creator:  id.Subject{ID: creatorID, Type: "user"},
		Updater:  id.Subject{ID: updaterID, Type: "user"},
	}

	Convey("Добавляем сервер", func() {
		err = st.Add(server)
		So(err, ShouldBeNil)
		Convey("Проверяем что в бд сохранился сервер", func() {
			result, err := st.Get(serverID)
			So(err, ShouldBeNil)
			So(result, ShouldNotBeNil)
			Convey("Проверяем что проставилась дата создания и обновления", func() {
				So(result.CreatedAt.IsZero(), ShouldEqual, false)
				So(result.UpdatedAt.IsZero(), ShouldEqual, false)
				So(result.CreatedAt.UnixNano(), ShouldEqual, result.UpdatedAt.UnixNano())
			})
			checkServers(
				"Проверяем значение основных параметров",
				result,
				server,
			)
			Convey("Проверяем что сервер нельзя создать повторно", func() {
				err = st.Add(server)
				So(err, ShouldNotBeNil)
				So(storages.CheckExists(err), ShouldEqual, true)
				So(storages.CheckNotFound(err), ShouldEqual, false)
				So(err.Error(), ShouldNotEqual, "")
			})
			Convey("Проверяем удаление сервера", func() {
				err := st.Delete(serverID, id.Subject{ID: updaterID, Type: subjects.User})
				So(err, ShouldBeNil)
				So(storages.CheckNotFound(err), ShouldEqual, false)
				So(storages.CheckExists(err), ShouldEqual, false)
				result, err := st.Get(serverID)
				So(result, ShouldBeNil)
				So(err, ShouldNotBeNil)
				So(storages.CheckNotFound(err), ShouldEqual, true)
				So(storages.CheckExists(err), ShouldEqual, false)
				So(err.Error(), ShouldEqual, fmt.Sprintf("server not found (%s)", serverID.String()))
			})
		})
	})
	Convey("Проверяем получение наименее загруженных серверов", func() {
		items := []*servers.Server{
			GenerateServer(),
			GenerateServer(),
			GenerateServer(),
			GenerateServer(),
			GenerateServer(),
			GenerateServer(),
			GenerateServer(),
		}
		items[0].StoredDataSize = 10008
		items[1].StoredDataSize = 10001
		items[2].StoredDataSize = 10002
		items[3].StoredDataSize = 20002
		items[4].StoredDataSize = 10003
		items[5].StoredDataSize = 10000
		items[6].StoredDataSize = 20000
		for _, item := range items {
			err = st.Add(item)
			So(err, ShouldBeNil)
		}
		list, err := st.ListOfLessBusy(4)
		So(err, ShouldBeNil)
		So(list, ShouldNotBeNil)
		So(len(*list), ShouldEqual, 4)

		list2 := *list

		So(list2[0].ServerID.String(), ShouldEqual, items[5].ServerID.String())
		So(list2[1].ServerID.String(), ShouldEqual, items[1].ServerID.String())
		So(list2[2].ServerID.String(), ShouldEqual, items[2].ServerID.String())
		So(list2[3].ServerID.String(), ShouldEqual, items[4].ServerID.String())
	})
	Convey("Проверяем обновление размера заполненной памяти", func() {
		server.StoredDataSize = 10008
		err = st.Add(server)
		So(err, ShouldBeNil)
		item, err := st.Get(server.ServerID)
		So(err, ShouldBeNil)
		So(item, ShouldNotBeNil)
		So(item.StoredDataSize, ShouldEqual, 10008)

		err = st.SetStoredDataSize(server.ServerID, 800, id.Subject{ID: updaterID, Type: subjects.User})
		So(err, ShouldBeNil)

		item, err = st.Get(server.ServerID)
		So(err, ShouldBeNil)
		So(item, ShouldNotBeNil)
		So(item.StoredDataSize, ShouldEqual, 800)
	})
	Convey("Проверяем что нельзя получить не существующий сервер", func() {
		result, err := st.Get(serverID)
		So(err, ShouldNotBeNil)
		So(result, ShouldBeNil)
		So(storages.CheckNotFound(err), ShouldEqual, true)
		So(storages.CheckExists(err), ShouldEqual, false)
		So(
			err.Error(),
			ShouldEqual,
			fmt.Sprintf("server not found (%s)", serverID.String()),
		)
	})
	Convey("Проверяем что нельзя получить сервер по пустому идентификатору", func() {
		result, err := st.Get(id.ServerID{})
		So(err, ShouldNotBeNil)
		So(result, ShouldBeNil)
		So(storages.CheckNotFound(err), ShouldEqual, false)
		So(storages.CheckExists(err), ShouldEqual, false)
		So(err.Error(), ShouldEqual, "empty serverID")
	})
	Convey("Проверяем что нельзя удалить не существующий сервер", func() {
		err := st.Delete(serverID, id.Subject{ID: updaterID, Type: subjects.User})
		So(err, ShouldNotBeNil)
		So(storages.CheckNotFound(err), ShouldEqual, true)
		So(storages.CheckExists(err), ShouldEqual, false)
		So(err.Error(), ShouldEqual, fmt.Sprintf("delete server error: server not found (%s)", serverID.String()))
	})
	Convey("Проверяем что нельзя удалить сервер по пустому идентификатору", func() {
		err := st.Delete(id.ServerID{}, id.Subject{ID: updaterID, Type: subjects.User})
		So(err, ShouldNotBeNil)
		So(storages.CheckNotFound(err), ShouldEqual, false)
		So(storages.CheckExists(err), ShouldEqual, false)
		So(err.Error(), ShouldEqual, "empty serverID")
	})
}

func checkServers(
	title string,
	result *servers.Server,
	server *servers.Server,
) {
	Convey(title, func() {
		So(result, ShouldNotBeNil)
		Convey("ServerID", func() {
			So(result.ServerID.String(), ShouldEqual, server.ServerID.String())
		})
		Convey("Host", func() {
			So(result.Host, ShouldEqual, server.Host)
		})
		Convey("Port", func() {
			So(result.Port, ShouldEqual, server.Port)
		})
		Convey("StoredDataSize", func() {
			So(result.StoredDataSize, ShouldEqual, server.StoredDataSize)
		})
		Convey("CreatorID", func() {
			So(result.Creator.ID.String(), ShouldEqual, server.Creator.ID.String())
		})
		Convey("UpdaterID", func() {
			So(result.Updater.ID.String(), ShouldEqual, server.Updater.ID.String())
		})
	})
}
