package postgres

import (
	"errors"
	"testing"

	"gorm.io/gorm"
	"gorm.io/gorm/logger"

	driver "github.com/mantyr/karma8-http-file-storage-service/internal/drivers/postgres"
	storage "github.com/mantyr/karma8-http-file-storage-service/internal/storages/servers"
)

// Storage это реализация хранилища
type Storage struct {
	*driver.Storage
	db     *gorm.DB
	conf   *driver.Config
	logger logger.Interface
}

// New возвращает новый Storage
func New(conf *driver.Config) (storage.Storage, error) {
	driver, err := driver.New(conf)
	if err != nil {
		return nil, err
	}
	return &Storage{
		Storage: driver,
		db:      driver.DB(),
		conf:    driver.Config(),
		logger:  driver.Logger(),
	}, nil
}

// Flush отчищает базу данных для запуска изолированного теста
func (s *Storage) Flush(t *testing.T) error {
	if t == nil || t.Name() == "" {
		return errors.New("exec flush only in testing")
	}
	return s.db.Exec("TRUNCATE servers RESTART IDENTITY").Error
}
