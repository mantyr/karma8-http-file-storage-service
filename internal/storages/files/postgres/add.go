package postgres

import (
	"errors"
	"time"

	driver "github.com/mantyr/karma8-http-file-storage-service/internal/drivers/postgres"
	"github.com/mantyr/karma8-http-file-storage-service/internal/storages"
	"github.com/mantyr/karma8-http-file-storage-service/internal/storages/files"
)

// Add добавляет информацию о файле
func (s *Storage) Add(file *files.File) error {
	if file == nil {
		return errors.New("empty file")
	}
	err := file.Check()
	if err != nil {
		return err
	}
	item := &File{
		NamespaceID:  file.NamespaceID,
		FileID:       file.FileID,
		Name:         file.Name,
		Enabled:      file.Enabled,
		CreatorID:    file.Creator.ID,
		CreatorType:  file.Creator.Type,
		UpdaterID:    file.Updater.ID,
		UpdaterType:  file.Updater.Type,
		CreatedAt:    time.Now(),
	}
	item.UpdatedAt = item.CreatedAt
	item.SetServers(file.Servers)
	err = s.db.Create(item).Error
	if driver.CheckDuplicate(err) {
		return storages.NewExists(err)
	}
	return err
}
