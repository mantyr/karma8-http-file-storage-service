package constant

import (
	cli "github.com/urfave/cli/v2"
)

const (
	GRPCHost = "localhost"
	GRPCPort = "443"
)

const (
	GRPCHostFlag = "grpc.host"
	GRPCPortFlag = "grpc.port"
)

var GRPCFlags = []cli.Flag{
	&cli.StringFlag{
		Name:   GRPCHostFlag,
		Value:  GRPCHost,
		Usage:  "GRPC server host",
	},
	&cli.StringFlag{
		Name:   GRPCPortFlag,
		Value:  GRPCPort,
		Usage:  "GRPC server port",
	},
}
