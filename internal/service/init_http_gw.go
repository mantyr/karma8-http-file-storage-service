package service

import (
	"github.com/urfave/cli/v2"

	"github.com/mantyr/karma8-http-file-storage-service/internal/services/http/gw"
)

func (s *Service) InitHTTPGW(ctx *cli.Context) error {
	return gw.Register(
		s.HTTP.Router(),
		s.Connectors,
//		s.HTTP.staticPath,
	),
}
