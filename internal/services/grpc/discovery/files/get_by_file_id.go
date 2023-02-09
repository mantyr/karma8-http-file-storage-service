package files

import (
	"context"

	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
	timestamp "google.golang.org/protobuf/types/known/timestamppb"

	api "github.com/mantyr/karma8-http-file-storage-service/api/karma8-discovery/files"
	"github.com/mantyr/karma8-http-file-storage-service/api/karma8-discovery/subjects"

	"github.com/mantyr/karma8-http-file-storage-service/internal/id"
	"github.com/mantyr/karma8-http-file-storage-service/internal/services/grpc/discovery/utils"
	"github.com/mantyr/karma8-http-file-storage-service/internal/storages"
)

// GetByFileID возвращает информацию о файле по идентификатору
func (s *Service) GetByFileID(
	ctx context.Context,
	req *api.GetByFileIDRequest,
) (
	*api.GetByFileIDResponse,
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
	fileID, err := id.ParseFileID(req.FileId)
	if err != nil {
		return nil, status.Errorf(codes.InvalidArgument, "invalid file_id: %s", err.Error())
	}
	if fileID.IsZero() {
		return nil, status.Error(codes.Internal, "empty file_id")
	}

	file, err := s.storages.Files.GetByFileID(namespaceID, fileID)
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
	return &api.GetByFileIDResponse{
		File: &api.File{
			NamespaceId: file.NamespaceID.String(),
			FileId:      file.FileID.String(),
			FileName:    file.Name,
			Enabled:     file.Enabled,
			Servers:     file.GetServers(),
			Creator:     &subjects.Subject{SubjectId: file.Creator.ID.String(), SubjectType: utils.ConvertSubjectToGRPC(file.Creator.Type)},
			Updater:     &subjects.Subject{SubjectId: file.Updater.ID.String(), SubjectType: utils.ConvertSubjectToGRPC(file.Updater.Type)},
			CreatedAt:   timestamp.New(file.CreatedAt),
			UpdatedAt:   timestamp.New(file.UpdatedAt),
		},
	}, nil
}
