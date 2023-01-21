package postgres

import (
	"errors"
	"fmt"
	"time"

	"github.com/mantyr/karma8-http-file-storage-service/internal/id"
	"github.com/mantyr/karma8-http-file-storage-service/internal/storages"
)

func (s *Storage) update(
	namespaceID id.NamespaceID,
	fileID id.FileID,
	updater id.Subject,
	params map[string]interface{},
) error {
	switch {
	case namespaceID.IsZero():
		return errors.New("empty namespace_id")
	case fileID.IsZero():
		return errors.New("empty file_id")
	case params == nil:
		return errors.New("empty params")
	case len(params) == 0:
		return errors.New("empty params")
	}
	if err := updater.Check(); err != nil {
		return fmt.Errorf("updater error: %v", err)
	}
	params["updated_at"] = time.Now()
	params["updater_id"] = updater.ID
	params["updater_type"] = updater.Type
	result := s.db.Model(
		File{},
	).Where(
		`
			namespace_id = ?
			AND file_id = ?
		`,
		namespaceID,
		fileID,
	).Updates(
		params,
	)
	if result.Error != nil {
		return result.Error
	}
	if result.RowsAffected < 1 {
		return storages.NewNotFound(
			fmt.Errorf(
				"update file error: file not found (namespace_id=%s, file_id=%s)",
				namespaceID.String(),
				fileID.String(),
			),
		)
	}
	return nil
}
