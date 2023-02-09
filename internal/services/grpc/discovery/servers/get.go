package servers

import (
	"context"

	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
	timestamp "google.golang.org/protobuf/types/known/timestamppb"

	api "github.com/mantyr/karma8-http-file-storage-service/api/karma8-discovery/servers"
	"github.com/mantyr/karma8-http-file-storage-service/api/karma8-discovery/subjects"

	"github.com/mantyr/karma8-http-file-storage-service/internal/id"
	"github.com/mantyr/karma8-http-file-storage-service/internal/services/grpc/discovery/utils"
	"github.com/mantyr/karma8-http-file-storage-service/internal/storages"
)

// Get возвращает информацию о сервере
func (s *Service) Get(
	ctx context.Context,
	req *api.GetRequest,
) (
	*api.GetResponse,
	error,
) {
	if req == nil {
		return nil, status.Error(codes.Internal, "empty request")
	}
	serverID, err := id.ParseServerID(req.ServerId)
	if err != nil {
		return nil, status.Errorf(codes.InvalidArgument, "invalid server_id: %s", err.Error())
	}
	if serverID.IsZero() {
		return nil, status.Error(codes.Internal, "empty server_id")
	}
	server, err := s.storages.Servers.Get(serverID)
	if err != nil {
		if storages.CheckNotFound(err) {
			return nil, status.Errorf(
				codes.NotFound,
				"server not found (server_id: %s)",
				serverID.String(),
			)
		}
	}
	if err != nil {
		return nil, status.Errorf(codes.Internal, err.Error())
	}
	return &api.GetResponse{
		Server: &api.Server{
			ServerId:       server.ServerID.String(),
			Host:           server.Host,
			Port:           int32(server.Port),
			StoredDataSize: server.StoredDataSize,
			Creator:        &subjects.Subject{SubjectId: server.Creator.ID.String(), SubjectType: utils.ConvertSubjectToGRPC(server.Creator.Type)},
			Updater:        &subjects.Subject{SubjectId: server.Updater.ID.String(), SubjectType: utils.ConvertSubjectToGRPC(server.Updater.Type)},
			CreatedAt:      timestamp.New(server.CreatedAt),
			UpdatedAt:      timestamp.New(server.UpdatedAt),
		},
	}, nil
}
