package namespaces

import (
	"testing"

	"github.com/mantyr/karma8-http-file-storage-service/internal/id"
)

// Storage это интерфейс к хранилищу информации о пространствах в рамках которых хранятся файлы.
// Файлы между пространствами не пересекаются.
type Storage interface {
	Testing

	// Tx возвращает интерфейс хранилища в транзакции
	Tx() Tx

	// Add добавляет информацию о пространстве
	Add(*Namespace) error

	// Get возвращает информацию о пространстве
	Get(id.NamespaceID) (*Namespace, error)

	// List возвращает список зарегистрированных пространств
	List() (*[]Namespace, error)

	// Enable включает доступ к пространству для пользователей
	Enable(
		namespaceID id.NamespaceID,
		updater id.Subject,
	) error

	// Disable выключает доступ к пространству для пользователей
	Disable(
		namespaceID id.NamespaceID,
		updater id.Subject,
	) error

	// Delete удаляет информацию о пространстве
	Delete(
		namespaceID id.NamespaceID,
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
