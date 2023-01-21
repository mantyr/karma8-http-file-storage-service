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
	updater id.Subject,
	params map[string]interface{},
) error {
	switch {
	case namespaceID.IsZero():
		return errors.New("empty namespace_id")
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
		Namespace{},
	).Where(
		`namespace_id = ?`,
		namespaceID,
	).Updates(
		params,
	)
	if result.Error != nil {
		return result.Error
	}
	if result.RowsAffected < 1 {
		return storages.NewNotFound(
			fmt.Errorf(
				"update namespace error: namespace not found (namespace_id=%s)",
				namespaceID.String(),
			),
		)
	}
	return nil
}
