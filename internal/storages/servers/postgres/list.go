package postgres

import (
	"errors"

	"gorm.io/gorm"

	"github.com/mantyr/karma8-http-file-storage-service/internal/id"
	"github.com/mantyr/karma8-http-file-storage-service/internal/storages/servers"
)

// List возвращает информацию обо всех зарегистрированных серверах хранения файлов
func (s *Storage) List() (
	*[]servers.Server,
	error,
) {
	return s.list(s.db)
}

func (s *Storage) list(
	db *gorm.DB,
) (
	*[]servers.Server,
	error,
) {
	if db == nil {
		return nil, errors.New("empty db")
	}
	items := []Server{}
	err := db.Find(&items).Error
	if err != nil {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			return &[]servers.Server{}, nil
		}
		return nil, err
	}
	var result []servers.Server
	for _, item := range items {
		arr := servers.Server{
			ServerID:  item.ServerID,
			Host:      item.Host,
			Port:      item.Port,
			Creator:   id.Subject{ID: item.CreatorID, Type: item.CreatorType},
			Updater:   id.Subject{ID: item.UpdaterID, Type: item.UpdaterType},
			CreatedAt: item.CreatedAt,
			UpdatedAt: item.UpdatedAt,
		}
		result = append(result, arr)
	}
	return &result, nil
}
