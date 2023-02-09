package postgres

import (
	"errors"

	"github.com/mantyr/karma8-http-file-storage-service/internal/id"
	"github.com/mantyr/karma8-http-file-storage-service/internal/storages/files"
)

// ListByNamespaceID возвращает информацию обо всех файлах в рамках пространства для хранения файлов
func (s *Storage) ListByNamespaceID(
	namespaceID id.NamespaceID,
) (
	*[]files.File,
	error,
) {
	if namespaceID.IsZero() {
		return nil, errors.New("empty namespaceID")
	}

	var items []File
	if err := s.db.Where(
		`namespace_id = ?`,
		namespaceID,
	).Find(&items).Error; err != nil {
		return nil, err
	}
	var result []files.File
	for _, item := range items {
		servers, err := item.GetServers()
		if err != nil {
			return nil, err
		}
		arr := files.File{
			NamespaceID: item.NamespaceID,
			FileID:      item.FileID,
			Name:        item.Name,
			Servers:     servers,
			Enabled:     item.Enabled,
			Finished:    item.Finished,
			Size:        item.Size,
			Creator:     id.Subject{ID: item.CreatorID, Type: item.CreatorType},
			Updater:     id.Subject{ID: item.UpdaterID, Type: item.UpdaterType},
			CreatedAt:   item.CreatedAt,
			UpdatedAt:   item.UpdatedAt,
		}
		result = append(result, arr)
	}
	return &result, nil
}
