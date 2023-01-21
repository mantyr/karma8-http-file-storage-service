package postgres

import (
	"errors"
	"time"

	driver "github.com/mantyr/karma8-http-file-storage-service/internal/drivers/postgres"
	"github.com/mantyr/karma8-http-file-storage-service/internal/storages"
	"github.com/mantyr/karma8-http-file-storage-service/internal/storages/namespaces"
)

// Add добавляет информацию о пространстве с файлами
func (s *Storage) Add(namespace *namespaces.Namespace) error {
	if namespace == nil {
		return errors.New("empty namespace")
	}
	err := namespace.Check()
	if err != nil {
		return err
	}
	item := &Namespace{
		NamespaceID: namespace.NamespaceID,
		Enabled:     namespace.Enabled,
		CreatorID:   namespace.Creator.ID,
		CreatorType: namespace.Creator.Type,
		UpdaterID:   namespace.Updater.ID,
		UpdaterType: namespace.Updater.Type,
		CreatedAt:   time.Now(),
	}
	item.UpdatedAt = item.CreatedAt
	err = s.db.Create(item).Error
	if driver.CheckDuplicate(err) {
		return storages.NewExists(err)
	}
	return err
}
