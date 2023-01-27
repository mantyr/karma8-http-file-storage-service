package postgres

import (
	"errors"
	"fmt"

	"github.com/mantyr/karma8-http-file-storage-service/internal/id"
	"github.com/mantyr/karma8-http-file-storage-service/internal/storages"
)

// Delete удаляет информацию о пространстве с файлами
func (s *Storage) Delete(
	namespaceID id.NamespaceID,
	updater id.Subject,
) error {
	if namespaceID.IsZero() {
		return errors.New("empty namespaceID")
	}
	if err := updater.Check(); err != nil {
		return fmt.Errorf("bad updater subject: %v", err.Error())
	}
	result := s.db.Where(
		`namespace_id = ?`,
		namespaceID,
	).Delete(&Namespace{})
	if err := result.Error; err != nil {
		return err
	}
	if result.RowsAffected < 1 {
		return storages.NewNotFound(
			fmt.Errorf(
				"delete namespace error: namespace not found (%s)",
				namespaceID.String(),
			),
		)
	}
	return nil
}
