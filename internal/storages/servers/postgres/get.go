package postgres

import (
	"errors"
	"fmt"

	"gorm.io/gorm"

	"github.com/mantyr/karma8-http-file-storage-service/internal/id"
	"github.com/mantyr/karma8-http-file-storage-service/internal/storages"
	"github.com/mantyr/karma8-http-file-storage-service/internal/storages/servers"
)

// Get возвращает информацию о сервере хранения файлов
func (s *Storage) Get(
	serverID id.ServerID,
) (
	*servers.Server,
	error,
) {
	if serverID.IsZero() {
		return nil, errors.New("empty server_id")
	}
	item := &Server{}
	err := s.db.Where(
		`server_id = ?`,
		serverID,
	).First(item).Error
	if err != nil {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			return nil, storages.NewNotFound(
				fmt.Errorf(
					"server not found (server_id=%s)",
					serverID.String(),
				),
			)
		}
		return nil, err
	}
	result := &servers.Server{
		ServerID:  item.ServerID,
		Host:      item.Host,
		Port:      item.Port,
		Creator:   id.Subject{ID: item.CreatorID, Type: item.CreatorType},
		Updater:   id.Subject{ID: item.UpdaterID, Type: item.UpdaterType},
		CreatedAt: item.CreatedAt,
		UpdatedAt: item.UpdatedAt,
	}
	return result, nil
}
