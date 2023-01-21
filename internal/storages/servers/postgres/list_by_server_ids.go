package postgres

import (
	"github.com/mantyr/karma8-http-file-storage-service/internal/id"
	"github.com/mantyr/karma8-http-file-storage-service/internal/storages/servers"
)

// ListByServerID возвращает информацию о наборе серверов хранения файлов
func (s *Storage) ListByServerIDs(
	ids ...id.ServerID,
) (
	*[]servers.Server,
	error,
) {
	db := s.db.Where(`server_id IN ?`, ids)
	return s.list(db)
}
