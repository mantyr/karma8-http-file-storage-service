package postgres

import (
	"github.com/mantyr/karma8-http-file-storage-service/internal/id"
	"github.com/mantyr/karma8-http-file-storage-service/internal/storages/namespaces"
)

// List возвращает все зарегистрированные пространства для файлов
func (s *Storage) List() (
	*[]namespaces.Namespace,
	error,
) {
	var items []Namespace
	if err := s.db.Find(&items).Error; err != nil {
		return nil, err
	}
	var result []namespaces.Namespace
	for _, item := range items {
		arr := namespaces.Namespace{
			NamespaceID: item.NamespaceID,
			Enabled:     item.Enabled,
			Creator:     id.Subject{ID: item.CreatorID, Type: item.CreatorType},
			Updater:     id.Subject{ID: item.UpdaterID, Type: item.UpdaterType},
			CreatedAt:   item.CreatedAt,
			UpdatedAt:   item.UpdatedAt,
		}
		result = append(result, arr)
	}
	return &result, nil
}
