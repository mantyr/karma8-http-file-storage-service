package postgres

import (
	"errors"
	"fmt"

	"gorm.io/gorm"

	"github.com/mantyr/karma8-http-file-storage-service/internal/id"
	"github.com/mantyr/karma8-http-file-storage-service/internal/storages"
	"github.com/mantyr/karma8-http-file-storage-service/internal/storages/namespaces"
)

// Get возвращает информацию о пространстве с файлами
func (s *Storage) Get(
	namespaceID id.NamespaceID,
) (
	*namespaces.Namespace,
	error,
) {
	if namespaceID.IsZero() {
		return nil, errors.New("empty namespace_id")
	}
	item := &Namespace{}
	err := s.db.Where(
		`namespace_id = ?`,
		namespaceID,
	).First(item).Error
	if err != nil {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			return nil, storages.NewNotFound(
				fmt.Errorf(
					"namespace not found (namespace_id=%s)",
					namespaceID.String(),
				),
			)
		}
		return nil, err
	}
	result := &namespaces.Namespace{
		NamespaceID: item.NamespaceID,
		Enabled:     item.Enabled,
		Creator:     id.Subject{ID: item.CreatorID, Type: item.CreatorType},
		Updater:     id.Subject{ID: item.UpdaterID, Type: item.UpdaterType},
		CreatedAt:   item.CreatedAt,
		UpdatedAt:   item.UpdatedAt,
	}
	return result, nil
}
