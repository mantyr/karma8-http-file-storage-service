package service

import (
	"fmt"

	"github.com/mantyr/karma8-http-file-storage-service/internal/storages/servers/postgres"
)

func (s *Service) addStorageServers() (err error) {
	s.Storages.Servers, err = postgres.NewDB(s.Drivers.postgres)
	if err != nil {
		return fmt.Errorf("servers storage error: %v", err.Error())
	}
	return nil
}
