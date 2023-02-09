package files

import (
	"testing"

	"github.com/mantyr/karma8-http-file-storage-service/internal/id"
)

// Storage это интерфейс к хранилищу мета-информации о файлах
type Storage interface {
	Testing

	// Tx возвращает интерфейс хранилища в транзакции
	Tx() Tx

	// Add добавляет информацию о файле
	Add(*File) error

	// GetByFileID возвращает информацию о файле по идентификатору
	GetByFileID(id.NamespaceID, id.FileID) (*File, error)

	// GetByFileName возвращает информацию о файле по названию файла
	GetByFileName(id.NamespaceID, string) (*File, error)

	// ListByNamespaceID возвращает информацию о файлах зарегистрированных в пространстве
	ListByNamespaceID(id.NamespaceID) (*[]File, error)

	// Enable включает доступ к файлу для пользователей
	Enable(
		namespaceID id.NamespaceID,
		fileID id.FileID,
		updater id.Subject,
	) error

	// Disable выключает доступ к файлу для пользователей
	Disable(
		namespaceID id.NamespaceID,
		fileID id.FileID,
		updater id.Subject,
	) error

	// NoFinish помечает файл как требующий закачки
	NoFinish(
		namespaceID id.NamespaceID,
		fileID id.FileID,
		updater id.Subject,
	) error

	// Finish помечает файл как полностью закачанный
	Finish(
		namespaceID id.NamespaceID,
		fileID id.FileID,
		size int64,
		updater id.Subject,
	) error

	// Delete удаляет информацию о файле
	Delete(
		namespaceID id.NamespaceID,
		fileID id.FileID,
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
