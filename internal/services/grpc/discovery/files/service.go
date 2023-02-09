package files

import (
	"google.golang.org/grpc"

	"github.com/mantyr/karma8-http-file-storage-service/api/karma8-discovery/files"
	"github.com/mantyr/karma8-http-file-storage-service/internal/storages"
)

// Service обслуживает запросы по управлению реестром файлов
type Service struct {
	files.UnimplementedFileServiceServer
	storages *storages.Storages
}

// Register регистрирует реализацию сервиса в GRPC сервере
func Register(
	server *grpc.Server,
	st *storages.Storages,
) error {
	service, err := New(
		st,
	)
	if err != nil {
		return err
	}
	files.RegisterFileServiceServer(server, service)
	return nil
}

// New возвращает новый GRPC сервис
func New(
	st *storages.Storages,
) (
	*Service,
	error,
) {
	if err := st.Check(); err != nil {
		return nil, err
	}
	return &Service{
		storages: st,
	}, nil
}
