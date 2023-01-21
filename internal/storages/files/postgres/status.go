package postgres

import (
	"github.com/mantyr/karma8-http-file-storage-service/internal/id"
)

// Disable выключает файл для всех
func (s *Storage) Disable(
	namespaceID id.NamespaceID,
	fileID id.FileID,
	updater id.Subject,
) error {
	params := make(map[string]interface{})
	params["enabled"] = false
	return s.update(namespaceID, fileID, updater, params)
}

// Enable включает файлн для использования
func (s *Storage) Enable(
	namespaceID id.NamespaceID,
	fileID id.FileID,
	updater id.Subject,
) error {
	params := make(map[string]interface{})
	params["enabled"] = true
	return s.update(namespaceID, fileID, updater, params)
}
