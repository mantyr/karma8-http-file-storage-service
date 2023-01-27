package gw

import (
	"errors"
	"fmt"
	"os"

	"github.com/gin-gonic/gin"

	"github.com/mantyr/karma8-http-file-storage-service/internal/connectors"
)

type Service struct {
	connectors *connectors.Connectors
}

// Register это метод который служит для регистрации обработчиков для http сервиса
func Register(
	router *gin.Engine,
	connectors *connectors.Connectors,
) error {
	if router == nil {
		return errors.New("empty http router")
	}
	service, err := New(
		connectors,
		filesPath,
	)
	if err != nil {
		return err
	}
	router.GET("api/v1/namespaces/:namespace_id/files/:file_id", service.GetByFileID)

	group := router.Group("api/v1/namespaces/:namespace_id/files/{file_id}")
	group.PUT("/", service.PutByFileID)
	group.GET("/", service.GetByFileID)

	group := router.Group("api/v1/namespaces/:namespace_id/by-path/:path")
	group.PUT("/", service.PutByPath)
	group.GET("/", service.GetByPath)

	return nil
}

func New(
	connectors *connectors.Connectors,
	filesPath string,
) (
	*Service,
	error,
) {
	switch {
	case connectors == nil:
		return nil, errors.New("empty connectors")
	case connectors.Discovery == nil:
		return nil, errors.New("empty discovery connector")
	}
	return &Service{
		connectors: connectors,
	}, nil
}
