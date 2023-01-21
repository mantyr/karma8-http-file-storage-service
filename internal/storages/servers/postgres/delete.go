package postgres

import (
	"errors"
	"fmt"

	"github.com/mantyr/karma8-http-file-storage-service/internal/id"
	"github.com/mantyr/karma8-http-file-storage-service/internal/storages"
)

// Delete удаляет информацию о сервере хранения файлов
func (s *Storage) Delete(
	serverID id.ServerID,
	updater id.Subject,
) error {
	if serverID.IsZero() {
		return errors.New("empty serverID")
	}
	if err := updater.Check(); err != nil {
		return fmt.Errorf("bad updater subject: %v", err.Error())
	}
	result := s.db.Where(
		`server_id = ?`,
		serverID,
	).Delete(&Server{})
	if err := result.Error; err != nil {
		return err
	}
	if result.RowsAffected < 1 {
		return storages.NewNotFound(
			fmt.Errorf(
				"delete server error: server not found (%s)",
				serverID.String(),
			),
		)
	}
	return nil
}
