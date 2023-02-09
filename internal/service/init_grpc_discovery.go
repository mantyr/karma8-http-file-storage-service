package service

import (
	"github.com/urfave/cli/v2"

	"github.com/mantyr/karma8-http-file-storage-service/internal/services/grpc/discovery/servers"
	"github.com/mantyr/karma8-http-file-storage-service/internal/services/grpc/discovery/namespaces"
//	"github.com/mantyr/karma8-http-file-storage-service/internal/services/grpc/discovery/files"
)

func (s *Service) InitGRPCDiscovery(ctx *cli.Context) error {
	errs := []error{
		servers.Register(s.GRPC.Server(), s.Storages),
		namespaces.Register(s.GRPC.Server(), s.Storages),
//		files.Register(s.GRPC.Server(), s.Storages),
	}
	for _, err := range errs {
		if err != nil {
			return err
		}
	}
	return nil
}
