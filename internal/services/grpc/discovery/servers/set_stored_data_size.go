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
)

// SetStoredDataSize устанавливает значение количества сохранённых данных на сервере
func (s *Service) SetStoredDataSize(
	ctx context.Context,
	req *api.SetStoredDataSizeRequest,
) (
	*empty.Empty,
	error,
) {
	switch {
	case req == nil:
		return nil, status.Error(codes.Internal, "empty request")
	case req.Updater == nil:
		return nil, status.Error(codes.InvalidArgument, "empty updater")
	}
	serverID, err := id.ParseServerID(req.ServerId)
	if err != nil {
		return nil, status.Errorf(codes.InvalidArgument, "invalid server_id: %s", err.Error())
	}
	if serverID.IsZero() {
		return nil, status.Error(codes.Internal, "empty server_id")
	}
	updater, err := id.NewSubject(
		req.Updater.SubjectId,
		utils.ConvertGRPCToSubject(req.Updater.SubjectType),
	)
	if err != nil {
		return nil, status.Errorf(
			codes.InvalidArgument,
			"expected updater is string: %s",
			err.Error(),
		)
	}
	err = s.storages.Servers.SetStoredDataSize(serverID, req.StoredDataSize, updater)
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
	return nil, nil
}
