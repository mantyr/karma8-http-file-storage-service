package gw

import (
	"net/http"
	"context"

	"github.com/gin-gonic/gin"
	"github.com/sirupsen/logrus"

	"github.com/mantyr/karma8-http-file-storage-service/api/karma8-discovery/namespaces"
	"github.com/mantyr/karma8-http-file-storage-service/api/karma8-discovery/files"
)

func (s *Service) GetByPath(ctx *gin.Context) {
	namespaceID := context.Param("namespace_id")
	filePath := context.Param("path")

	// todo: улучшить контекст
	ctx, cancel := context.WithCancel(context.Background())
	defer cancel()

	namespace, err := s.connectors.Discovery.Namespaces.Get(namespaces.GetRequest{
		NamespaceId: namespaceID,
	}
	switch status.Code(err) {
	case codes.OK:
	case codes.NotFound:
		context.Status(http.StatusNotFound)
		return
	default:
		log.Printf("discovery.Namespaces.Get error: %v", err.Error())
		context.Status(http.StatusInternalServerError)
		return
	}
	if !namespace.Enabled {
		context.Status(http.StatusNotFound)
		return
	}

	// получаем список серверов на которых хранятся кусочки
	fileInfo, err := s.connectors.Discovery.Files.GetByPath(files.GetRequest{
		NamespaceId: namespaceID,
		FilePath: filePath,
	})
	switch status.Code(err) {
	case codes.OK:
	case codes.NotFound:
		context.Status(http.StatusNotFound)
		return
	default:
		log.Printf("discovery.Files.Get error: %v", err.Error())
		context.Status(http.StatusInternalServerError)
		return
	}
	if !fileInfo.Enabled {
		context.Status(http.StatusNotFound)
		return
	}
	// выбираем нужный порядок серверов из пула, при необходимости подключаемся
	servers, err := s.connectors.ConnectToStorages(fileInfo.Servers)
	if err != nil {
		// todo: спрятать ошибку от пользователя
		context.String(http.StatusInternalServerError, err.Error())
		return 
	}
	engine := nat0.New(servers)
	engine.WriteTo(ctx.Writer)
}
