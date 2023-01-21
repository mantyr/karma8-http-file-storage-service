package postgres

import (
	"testing"

	. "github.com/smartystreets/goconvey/convey"

	driver "github.com/mantyr/karma8-http-file-storage-service/drivers/postgres"
	"github.com/mantyr/karma8-http-file-storage-service/internal/storages/namespaces/test"
)

// TestNamespaceTypePostgresStorage запускает набор тестов для хранилища пространст с файлами
func TestNamespaceTypePostgresStorage(t *testing.T) {
	Convey("Проверяем namespaces.Storage (postgres)", t, func() {
		conf, err := driver.NewTestConfig()
		So(err, ShouldBeNil)
		So(conf, ShouldNotBeNil)

		st, err := New(conf)
		So(err, ShouldBeNil)
		So(st, ShouldNotBeNil)

		test.Run(t, st)
	})
}
