package namespaces

import (
	"context"

	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
	timestamp "google.golang.org/protobuf/types/known/timestamppb"

	api "github.com/mantyr/karma8-http-file-storage-service/api/karma8-discovery/namespaces"
	"github.com/mantyr/karma8-http-file-storage-service/api/karma8-discovery/subjects"

	"github.com/mantyr/karma8-http-file-storage-service/internal/id"
	"github.com/mantyr/karma8-http-file-storage-service/internal/services/grpc/discovery/utils"
	"github.com/mantyr/karma8-http-file-storage-service/internal/storages"
)

// Get возвращает информацию о пространстве с файлами
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
	namespaceID, err := id.ParseNamespaceID(req.NamespaceId)
	if err != nil {
		return nil, status.Errorf(codes.InvalidArgument, "invalid namespace_id: %s", err.Error())
	}
	if namespaceID.IsZero() {
		return nil, status.Error(codes.Internal, "empty namespace_id")
	}
	namespace, err := s.storages.Namespaces.Get(namespaceID)
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
	return &api.GetResponse{
		Namespace: &api.Namespace{
			NamespaceId: namespace.NamespaceID.String(),
			Enabled:     namespace.Enabled,
			Creator:     &subjects.Subject{SubjectId: namespace.Creator.ID.String(), SubjectType: utils.ConvertSubjectToGRPC(namespace.Creator.Type)},
			Updater:     &subjects.Subject{SubjectId: namespace.Updater.ID.String(), SubjectType: utils.ConvertSubjectToGRPC(namespace.Updater.Type)},
			CreatedAt:   timestamp.New(namespace.CreatedAt),
			UpdatedAt:   timestamp.New(namespace.UpdatedAt),
		},
	}, nil
}
