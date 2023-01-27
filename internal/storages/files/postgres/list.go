package postgres

import (
	"github.com/mantyr/karma8-http-file-storage-service/internal/id"
	"github.com/mantyr/karma8-http-file-storage-service/internal/storages/files"
)

// List возвращает информацию обо всех файлах
func (s *Storage) List() (
	*[]files.File,
	error,
) {
	var items []File
	if err := s.db.Find(&items).Error; err != nil {
		return nil, err
	}
	var result []files.File
	for _, item := range items {
		servers, err := item.GetServers()
		if err != nil {
			return nil, err
		}
		arr := files.File{
			NamespaceID:  item.NamespaceID,
			FileID:       item.FileID,
			Name:         item.Name,
			Servers:      servers,
			Enabled:      item.Enabled,
			Creator:      id.Subject{ID: item.CreatorID, Type: item.CreatorType},
			Updater:      id.Subject{ID: item.UpdaterID, Type: item.UpdaterType},
			CreatedAt:    item.CreatedAt,
			UpdatedAt:    item.UpdatedAt,
		}
		result = append(result, arr)
	}
	return &result, nil
}
