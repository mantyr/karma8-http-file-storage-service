package files

import (
	"context"

	"github.com/golang/protobuf/ptypes/empty"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"

	api "github.com/mantyr/karma8-http-file-storage-service/api/karma8-discovery/files"

	"github.com/mantyr/karma8-http-file-storage-service/internal/id"
	"github.com/mantyr/karma8-http-file-storage-service/internal/services/grpc/discovery/utils"
	"github.com/mantyr/karma8-http-file-storage-service/internal/storages"
)

// Enable включает доступность файла для использования
func (s *Service) Enable(
	ctx context.Context,
	req *api.EnableRequest,
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
	fileID, err := id.ParseFileID(req.FileId)
	if err != nil {
		return nil, status.Errorf(codes.InvalidArgument, "invalid file_id: %s", err.Error())
	}
	if fileID.IsZero() {
		return nil, status.Error(codes.Internal, "empty file_id")
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
	err = s.storages.Files.Enable(namespaceID, fileID, updater)
	if err != nil {
		if storages.CheckNotFound(err) {
			return nil, status.Errorf(
				codes.NotFound,
				"file not found (file_id: %s)",
				fileID.String(),
			)
		}
	}
	if err != nil {
		return nil, status.Errorf(codes.Internal, err.Error())
	}
	return nil, nil
}
