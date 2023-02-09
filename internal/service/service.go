package service

import (
	"github.com/mantyr/karma8-http-file-storage-service/internal/connectors"
	"github.com/mantyr/karma8-http-file-storage-service/internal/storages"
)

type Service struct {
	GRPC       *GRPC
	HTTP       *HTTP
	Drivers    Drivers
	Storages   *storages.Storages
//	Services   *Services
	Connectors *connectors.Connectors
}

func New() (*Service, error) {
	return &Service{
		GRPC:       NewGRPC(),
		Connectors: &connectors.Connectors{},
		Storages:   &storages.Storages{},
//		Services:   &Services{},
		HTTP:       NewHTTP(),
	}, nil
}
