package servers

import (
	"context"

	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
	timestamp "google.golang.org/protobuf/types/known/timestamppb"

	api "github.com/mantyr/karma8-http-file-storage-service/api/karma8-discovery/servers"
	"github.com/mantyr/karma8-http-file-storage-service/api/karma8-discovery/subjects"

	"github.com/mantyr/karma8-http-file-storage-service/internal/services/grpc/discovery/utils"
)

// List возвращает список всех зарегистрированных серверов
func (s *Service) List(
	ctx context.Context,
	req *api.ListRequest,
) (
	*api.ListResponse,
	error,
) {
	items, err := s.storages.Servers.List()
	if err != nil {
		return nil, status.Errorf(codes.Internal, err.Error())
	}
	response := &api.ListResponse{}
	for _, item := range *items {
		item := &api.Server{
			ServerId:       item.ServerID.String(),
			Host:           item.Host,
			Port:           int32(item.Port),
			StoredDataSize: item.StoredDataSize,
			Creator:        &subjects.Subject{SubjectId: item.Creator.ID.String(), SubjectType: utils.ConvertSubjectToGRPC(item.Creator.Type)},
			Updater:        &subjects.Subject{SubjectId: item.Updater.ID.String(), SubjectType: utils.ConvertSubjectToGRPC(item.Updater.Type)},
			CreatedAt:      timestamp.New(item.CreatedAt),
			UpdatedAt:      timestamp.New(item.UpdatedAt),
		}
		response.Servers = append(response.Servers, item)
	}
	return response, nil
}
