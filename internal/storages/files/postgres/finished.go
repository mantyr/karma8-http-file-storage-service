package postgres

import (
	"github.com/mantyr/karma8-http-file-storage-service/internal/id"
)

// NoFinish помечает файл как требующий закачки
func (s *Storage) NoFinish(
	namespaceID id.NamespaceID,
	fileID id.FileID,
	updater id.Subject,
) error {
	params := make(map[string]interface{})
	params["finished"] = false
	params["size"] = 0
	return s.update(namespaceID, fileID, updater, params)
}

// Finish помечает файл как полностью закачанный
func (s *Storage) Finish(
	namespaceID id.NamespaceID,
	fileID id.FileID,
	size int64,
	updater id.Subject,
) error {
	params := make(map[string]interface{})
	params["finished"] = true
	params["size"] = size
	return s.update(namespaceID, fileID, updater, params)
}
