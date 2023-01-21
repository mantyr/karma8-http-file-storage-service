package postgres

import (
	"github.com/mantyr/karma8-http-file-storage-service/internal/id"
)

// Disable выключает пространство с файлами для всех
func (s *Storage) Disable(
	namespaceID id.NamespaceID,
	updater id.Subject,
) error {
	params := make(map[string]interface{})
	params["enabled"] = false
	return s.update(namespaceID, updater, params)
}

// Enable включает пространство с файлами для использования
func (s *Storage) Enable(
	namespaceID id.NamespaceID,
	updater id.Subject,
) error {
	params := make(map[string]interface{})
	params["enabled"] = true
	return s.update(namespaceID, updater, params)
}
