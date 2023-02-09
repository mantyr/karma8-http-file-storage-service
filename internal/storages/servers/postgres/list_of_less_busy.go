package postgres

import (
	"fmt"

	"github.com/mantyr/karma8-http-file-storage-service/internal/storages/servers"
)

// ListOfLessBusy возвращает наименее загруженные сервера в количестве quantity штук
func (s *Storage) ListOfLessBusy(
	quantity int,
) (
	*[]servers.Server,
	error,
) {
	if quantity < 1 {
		return nil, fmt.Errorf("expected quantity >= 1 but actual %d", quantity)
	}
	db := s.db.Order("stored_data_size asc").Limit(quantity)
	return s.list(db)
}
