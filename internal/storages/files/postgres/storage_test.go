package postgres

import (
	"testing"

	. "github.com/smartystreets/goconvey/convey"

	driver "github.com/mantyr/karma8-http-file-storage-service/internal/drivers/postgres"
	"github.com/mantyr/karma8-http-file-storage-service/internal/storages/files/test"
)

// TestFileTypePostgresStorage запускает набор тестов для хранилища файлов
func TestFileTypePostgresStorage(t *testing.T) {
	Convey("Проверяем files.Storage (postgres)", t, func() {
		conf, err := driver.NewTestConfig()
		So(err, ShouldBeNil)
		So(conf, ShouldNotBeNil)

		st, err := New(conf)
		So(err, ShouldBeNil)
		So(st, ShouldNotBeNil)

		test.Run(t, st)
	})
}
