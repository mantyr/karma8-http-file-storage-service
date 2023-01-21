package storages

import (
	"github.com/mantyr/karma8-http-file-storage-service/internal/storages/files"
	"github.com/mantyr/karma8-http-file-storage-service/internal/storages/namespaces"
	"github.com/mantyr/karma8-http-file-storage-service/internal/storages/servers"
)

// Storages это набор ссылок на хранилища данных
type Storages struct {
	// Namespaces это интерфейс к хранилищу информации о пространствах в рамках которых хранятся файлы.
	// Файлы между пространствами не пересекаются.
	Namespaces namespaces.Storage

	// Servers это интерфейс к хранилищу информации о storage серверах для хранения реальных файлов
	Servers servers.Storage

	// Files это интерфейс к хранилищу мета-информации о файлах
	Files files.Storage
}
