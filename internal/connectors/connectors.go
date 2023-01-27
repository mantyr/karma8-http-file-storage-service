package connectors

import (
	discovery "github.com/mantyr/karma8-http-file-storage-service/api/karma8-discovery"
	storage "github.com/mantyr/karma8-http-file-storage-service/api/karma8-storage"

	"github.com/mantyr/karma8-http-file-storage-service/internal/id"
)

type Connectors struct {
	// Discovery это коннектор к karma8 discovery сервису
	Discovery *discovery.API

	// Storage это коннектор к конкретному karma8 storage сервису
	// Используется для karma8 storage cli интерфейса
	Storage *storage.API

	// storages это пул серверов для хранения частей файлов
	storages map[id.ServerID]*storage.API
}
