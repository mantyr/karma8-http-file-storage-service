package service

import (
	"github.com/mantyr/karma8-http-file-storage-service/internal/drivers/postgres"
)

type Drivers struct {
	postgres *postgres.Storage
}
