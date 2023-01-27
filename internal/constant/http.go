package constant

import (
	cli "github.com/urfave/cli/v2"
)

const (
	HTTPHost = "localhost"
	HTTPPort = "443"
)

const (
	HTTPHostFlag         = "http.host"
	HTTPPortFlag         = "http.port"
	HTTPReadTimeoutFlag  = "http.read.timeout"
	HTTPWriteTimeoutFlag = "http.write.timeout"
)

var HTTPFlags = []cli.Flag{
	&cli.StringFlag{
		Name:   HTTPHostFlag,
		Value:  HTTPHost,
		Usage:  "HTTP server host",
	},
	&cli.StringFlag{
		Name:   HTTPPortFlag,
		Value:  HTTPPort,
		Usage:  "HTTP server port",
	},
	&cli.StringFlag{
		Name:   HTTPReadTimeoutFlag,
		Usage:  "HTTP server read timeout",
	},
	&cli.StringFlag{
		Name:   HTTPWriteTimeoutFlag,
		Usage:  "HTTP server write timeout",
	},
}
