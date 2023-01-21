package postgres

import (
	"errors"

	driver "github.com/mantyr/karma8-http-file-storage-service/internal/drivers/postgres"
	storage "github.com/mantyr/karma8-http-file-storage-service/internal/storages/servers"
)

func NewDB(db *driver.Storage) (storage.Storage, error) {
	if db == nil {
		return nil, errors.New("empty db")
	}
	return &Storage{
		db:     db.DB(),
		conf:   db.Config(),
		logger: db.Logger(),
	}, nil
}
