package service

import (
	"fmt"

	"github.com/mantyr/karma8-http-file-storage-service/internal/storages/namespaces/postgres"
)

func (s *Service) addStorageNamespaces() (err error) {
	s.Storages.Namespaces, err = postgres.NewDB(s.Drivers.postgres)
	if err != nil {
		return fmt.Errorf("namespaces storage error: %v", err.Error())
	}
	return nil
}
