package service

import (
//	"github.com/mantyr/karma8-http-file-storage-service/internal/connectors"
	"github.com/mantyr/karma8-http-file-storage-service/internal/storages"
)

type Service struct {
//	API        *api.API
//	GRPC       *GRPC
	HTTP       *HTTP
	Drivers    Drivers
	Storages   *storages.Storages
//	Connectors *connectors.Connectors
}

func New() (*Service, error) {
	return &Service{
//		API:        &api.API{},
//		GRPC:       NewGRPC(),
//		Connectors: &connectors.Connectors{},
		Storages:   &storages.Storages{},
		HTTP:       NewHTTP(),
	}, nil
}
