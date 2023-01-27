package service

import (
	"context"
	"net/http"

	"github.com/gin-gonic/gin"
	log "github.com/sirupsen/logrus"
	"github.com/urfave/cli/v2"

	"github.com/mantyr/karma8-http-file-storage-service/internal/constant"
)

type HTTP struct {
	router *gin.Engine
	server *http.Server
}

func NewHTTP() *HTTP {
	return &HTTP{}
}

func (s *HTTP) Name() string {
	return "HTTP"
}

func (s *HTTP) Router() *gin.Engine {
	return s.router
}

func (s *HTTP) Server() *http.Server {
	return s.server
}

func (s *HTTP) Init(ctx *cli.Context) error {
	s.router = gin.New()
	s.router.Use(
		gin.RecoveryWithWriter(log.WithFields(log.Fields{}).Writer()),
	)
	address := ctx.String(constant.HTTPHostFlag) + ":" + ctx.String(constant.HTTPPortFlag)
	readTimeout := ctx.Duration(constant.HTTPReadTimeoutFlag)
	writeTimeout := ctx.Duration(constant.HTTPWriteTimeoutFlag)

	log.Printf("Config HTTP: %v", address)
	log.Printf(" - http.read.timeout: %v", readTimeout)
	log.Printf(" - http.write.timeout: %v", writeTimeout)

	s.server = &http.Server{
		Addr:         address,
		Handler:      s.router,
		ReadTimeout:  readTimeout,
		WriteTimeout: writeTimeout,
	}

	return nil
}

func (s *HTTP) Start(ctx *cli.Context) error {
	return s.server.ListenAndServe()
}

func (s *HTTP) Stop(ctx *cli.Context) error {
	return s.server.Shutdown(context.Background())
}
