package service

import (
	"github.com/urfave/cli/v2"

	"github.com/mantyr/karma8-http-file-storage-service/internal/services/grpc/srorage/files"
)

func (s *Service) InitGRPCStorage(ctx *cli.Context) error {
	return files.Register(s.GRPC.Server())
}
