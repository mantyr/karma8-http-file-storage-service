package postgres

import (
	storage "github.com/mantyr/karma8-http-file-storage-service/internal/storages/namespaces"
)

// Tx это реализация хранилища внутри транзакции
type Tx struct {
	Storage
}

// Tx возвращает хранилище внутри транзакции
func (s *Storage) Tx() storage.Tx {
	return &Tx{
		Storage: Storage{
			db: s.db.Begin(),
		},
	}
}

// Rollback откатывает транзакцию
func (tx *Tx) Rollback() {
	tx.db.Rollback()
}

// Commit фиксирует транзакцию
func (tx *Tx) Commit() error {
	return tx.db.Commit().Error
}
