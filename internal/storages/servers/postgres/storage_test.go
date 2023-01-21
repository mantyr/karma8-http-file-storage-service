package postgres

import (
	"testing"

	. "github.com/smartystreets/goconvey/convey"

	driver "github.com/mantyr/karma8-http-file-storage-service/drivers/postgres"
	"github.com/mantyr/karma8-http-file-storage-service/internal/storages/servers/test"
)

// TestServerTypePostgresStorage запускает набор тестов для хранилища серверов хранения файлов
func TestServerTypePostgresStorage(t *testing.T) {
	Convey("Проверяем servers.Storage (postgres)", t, func() {
		conf, err := driver.NewTestConfig()
		So(err, ShouldBeNil)
		So(conf, ShouldNotBeNil)

		st, err := New(conf)
		So(err, ShouldBeNil)
		So(st, ShouldNotBeNil)

		test.Run(t, st)
	})
}
