package postgres

import (
	"errors"
	"fmt"

	"github.com/mantyr/karma8-http-file-storage-service/internal/id"
	"github.com/mantyr/karma8-http-file-storage-service/internal/storages"
)

// Delete удаляет информацию о файле
func (s *Storage) Delete(
	namespaceID id.NamespaceID,
	fileID id.FileID,
	updater id.Subject,
) error {
	switch {
	case namespaceID.IsZero():
		return errors.New("empty namespaceID")
	case fileID.IsZero():
		return errors.New("empty fileID")
	}
	if err := updater.Check(); err != nil {
		return fmt.Errorf("bad updater subject: %v", err.Error())
	}
	result := s.db.Where(
		`
			namespace_id = ?
			AND file_id = ?
		`,
		namespaceID,
		fileID,
	).Delete(&File{})
	if err := result.Error; err != nil {
		return err
	}
	if result.RowsAffected < 1 {
		return storages.NewNotFound(
			fmt.Errorf(
				"delete file error: file not found (namespace_id=%s, file_id=%s)",
				namespaceID.String(),
				fileID.String(),
			),
		)
	}
	return nil
}
