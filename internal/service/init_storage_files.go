package service

import (
	"fmt"

	"github.com/mantyr/karma8-http-file-storage-service/internal/storages/files/postgres"
)

func (s *Service) addStorageFiles() (err error) {
	s.Storages.Files, err = postgres.NewDB(s.Drivers.postgres)
	if err != nil {
		return fmt.Errorf("files storage error: %v", err.Error())
	}
	return nil
}
