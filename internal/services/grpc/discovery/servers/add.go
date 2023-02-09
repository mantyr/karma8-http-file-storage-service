package servers

import (
	"context"

	"github.com/golang/protobuf/ptypes/empty"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"

	api "github.com/mantyr/karma8-http-file-storage-service/api/karma8-discovery/servers"

	"github.com/mantyr/karma8-http-file-storage-service/internal/id"
	"github.com/mantyr/karma8-http-file-storage-service/internal/services/grpc/discovery/utils"
	"github.com/mantyr/karma8-http-file-storage-service/internal/storages"
	"github.com/mantyr/karma8-http-file-storage-service/internal/storages/servers"
)

// Add добавляет информацию о новом сервере хранения файлов
func (s *Service) Add(
	ctx context.Context,
	req *api.AddRequest,
) (
	*empty.Empty,
	error,
) {
	switch {
	case req == nil:
		return nil, status.Error(codes.Internal, "empty request")
	case req.Creator == nil:
		return nil, status.Error(codes.InvalidArgument, "empty creator")
	}
	serverID, err := id.ParseServerID(req.ServerId)
	if err != nil {
		return nil, status.Errorf(codes.InvalidArgument, "invalid server_id: %s", err.Error())
	}
	if serverID.IsZero() {
		return nil, status.Error(codes.Internal, "empty server_id")
	}
	creator, err := id.NewSubject(
		req.Creator.SubjectId,
		utils.ConvertGRPCToSubject(req.Creator.SubjectType),
	)
	if err != nil {
		return nil, status.Errorf(
			codes.InvalidArgument,
			"expected creator is string: %s",
			err.Error(),
		)
	}
	item := &servers.Server{
		ServerID:       serverID,
		Creator:        creator,
		Updater:        creator,
		Host:           req.Host,
		Port:           int(req.Port),
		StoredDataSize: int64(req.StoredDataSize),
	}
	err = s.storages.Servers.Add(item)
	if err != nil {
		if storages.CheckExists(err) {
			return nil, status.Errorf(codes.AlreadyExists, "server already exists")
		}
	}
	if err != nil {
		return nil, status.Errorf(codes.Internal, err.Error())
	}
	return nil, nil
}
