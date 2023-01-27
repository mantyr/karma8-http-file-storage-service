package service

import (
	"net"

	log "github.com/sirupsen/logrus"
	"github.com/urfave/cli/v2"
	"google.golang.org/grpc"

	grpc_middleware "github.com/grpc-ecosystem/go-grpc-middleware"
	grpc_logrus "github.com/grpc-ecosystem/go-grpc-middleware/logging/logrus"
	grpc_recovery "github.com/grpc-ecosystem/go-grpc-middleware/recovery"
	grpc_xrequest_id "github.com/higebu/go-grpc-interceptor/xrequestid"

	"github.com/mantyr/karma8-http-file-storage-service/internal/constant"
)

type GRPC struct {
	grpc *grpc.Server
}

func NewGRPC() *GRPC {
	return &GRPC{}
}

func (s *GRPC) Name() string {
	return "GRPC"
}

func (s *GRPC) Server() *grpc.Server {
	return s.grpc
}

func (s *GRPC) Init(ctx *cli.Context) error {
	logrusEntry := log.NewEntry(log.New())
	opts := []grpc_logrus.Option{}

	s.grpc = grpc.NewServer(
		grpc.StreamInterceptor(
			grpc_middleware.ChainStreamServer(
				grpc_logrus.StreamServerInterceptor(logrusEntry, opts...),
				grpc_recovery.StreamServerInterceptor(),
				grpc_xrequest_id.StreamServerInterceptor(),
			),
		),
		grpc.UnaryInterceptor(
			grpc_middleware.ChainUnaryServer(
				grpc_logrus.UnaryServerInterceptor(logrusEntry, opts...),
				grpc_recovery.UnaryServerInterceptor(),
				grpc_xrequest_id.UnaryServerInterceptor(),
			),
		),
	)
	return nil
}

func (s *GRPC) Start(ctx *cli.Context) error {
	address := ctx.String(constant.GRPCHostFlag) + ":" + ctx.String(constant.GRPCPortFlag)
	log.Printf("Config GRPC: %v", address)

	l, err := net.Listen("tcp", address)
	if err != nil {
		return err
	}
	return s.grpc.Serve(l)
}

func (s *GRPC) Stop(ctx *cli.Context) error {
	s.grpc.GracefulStop()
	return nil
}
