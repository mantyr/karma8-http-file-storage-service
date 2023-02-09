package namespaces

import (
	"context"

	"github.com/golang/protobuf/ptypes/empty"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"

	api "github.com/mantyr/karma8-http-file-storage-service/api/karma8-discovery/namespaces"

	"github.com/mantyr/karma8-http-file-storage-service/internal/id"
	"github.com/mantyr/karma8-http-file-storage-service/internal/services/grpc/discovery/utils"
	"github.com/mantyr/karma8-http-file-storage-service/internal/storages"
)

// Disable отключает доступность пространства для использования
func (s *Service) Disable(
	ctx context.Context,
	req *api.DisableRequest,
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
	namespaceID, err := id.ParseNamespaceID(req.NamespaceId)
	if err != nil {
		return nil, status.Errorf(codes.InvalidArgument, "invalid namespace_id: %s", err.Error())
	}
	if namespaceID.IsZero() {
		return nil, status.Error(codes.Internal, "empty namespace_id")
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
	err = s.storages.Namespaces.Disable(namespaceID, updater)
	if err != nil {
		if storages.CheckNotFound(err) {
			return nil, status.Errorf(
				codes.NotFound,
				"namespace not found (namespace_id: %s)",
				namespaceID.String(),
			)
		}
	}
	if err != nil {
		return nil, status.Errorf(codes.Internal, err.Error())
	}
	return nil, nil
}
