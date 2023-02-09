package servers

import (
	"testing"

	"github.com/mantyr/karma8-http-file-storage-service/internal/id"
)

// Storage это интерфейс к хранилищу информации о storage серверах для хранения реальных файлов
type Storage interface {
	Testing

	// Tx возвращает интерфейс хранилища в транзакции
	Tx() Tx

	// Add добавляет информацию о сервере хранения файлов
	Add(*Server) error

	// Get возвращает информацию о сервере хранения файлов
	Get(id.ServerID) (*Server, error)

	// ListByServerIDs возвращает информацию о наборе серверов хранения файлов
	ListByServerIDs(...id.ServerID) (*[]Server, error)

	// ListOfLessBusy возвращает наименее загруженные сервера в количестве quantity штук
	ListOfLessBusy(quantity int) (*[]Server, error)

	// SetStoredDataSize устанавливает значение загруженности сервера
	SetStoredDataSize(
		serverID id.ServerID,
		size int64,
		updater id.Subject,
	) error

	// Delete удаляет информацию о сервере хранения файлов
	Delete(
		serverID id.ServerID,
		updater id.Subject,
	) error

	// Close закрывает соединение с хранилищем
	Close() error
}

// Testing это интерфейс для отладки
type Testing interface {
	// Debug включает/выключает режим отладки
	Debug(status bool)

	// Check проверяет состояние подкдючения к хранилищу
	Check() error

	// Flush отчищает базу данных для запуска изолированного теста
	Flush(t *testing.T) error
}

// Tx это интерфейс хранилища внутри транзакции
type Tx interface {
	Storage

	// Rollback откатывает транзакцию
	Rollback()

	// Commit фиксирует транзакцию
	Commit() error
}
