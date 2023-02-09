package postgres

import (
	"github.com/mantyr/karma8-http-file-storage-service/internal/id"
)

// SetStoredDataSize устанавливает значение загруженности сервера
func (s *Storage) SetStoredDataSize(
	serverID id.ServerID,
	size int64,
	updater id.Subject,
) error {
	params := make(map[string]interface{})
	params["stored_data_size"] = size
	return s.update(serverID, updater, params)
}
