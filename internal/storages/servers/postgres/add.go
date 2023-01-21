package postgres

import (
	"errors"
	"time"

	driver "github.com/mantyr/karma8-http-file-storage-service/internal/drivers/postgres"
	"github.com/mantyr/karma8-http-file-storage-service/internal/storages"
	"github.com/mantyr/karma8-http-file-storage-service/internal/storages/servers"
)

// Add добавляет информацию о сервере хранения файлов
func (s *Storage) Add(server *servers.Server) error {
	if server == nil {
		return errors.New("empty server")
	}
	err := server.Check()
	if err != nil {
		return err
	}
	item := &Server{
		ServerID:    server.ServerID,
		Host:        server.Host,
		Port:        server.Port,
		CreatorID:   server.Creator.ID,
		CreatorType: server.Creator.Type,
		UpdaterID:   server.Updater.ID,
		UpdaterType: server.Updater.Type,
		CreatedAt:   time.Now(),
	}
	item.UpdatedAt = item.CreatedAt
	err = s.db.Create(item).Error
	if driver.CheckDuplicate(err) {
		return storages.NewExists(err)
	}
	return err
}
