package files

import (
	"context"

	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"

	api "github.com/mantyr/karma8-http-file-storage-service/api/karma8-discovery/files"

	"github.com/mantyr/karma8-http-file-storage-service/internal/id"
	"github.com/mantyr/karma8-http-file-storage-service/internal/services/grpc/discovery/utils"
	"github.com/mantyr/karma8-http-file-storage-service/internal/storages"
	"github.com/mantyr/karma8-http-file-storage-service/internal/storages/files"
)

// Add добавляет информацию о новом файле
func (s *Service) Add(
	ctx context.Context,
	req *api.AddRequest,
) (
	*api.AddResponse,
	error,
) {
	switch {
	case req == nil:
		return nil, status.Error(codes.Internal, "empty request")
	case req.Creator == nil:
		return nil, status.Error(codes.InvalidArgument, "empty creator")
	}
	namespaceID, err := id.ParseNamespaceID(req.NamespaceId)
	if err != nil {
		return nil, status.Errorf(codes.InvalidArgument, "invalid namespace_id: %s", err.Error())
	}
	if namespaceID.IsZero() {
		return nil, status.Error(codes.Internal, "empty namespace_id")
	}
	if req.FileName == "" {
		return nil, status.Error(codes.InvalidArgument, "empty file_name")
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
	var fileID id.FileID
	if req.FileId != "" {
		fileID, err = id.ParseFileID(req.FileId)
		if err != nil {
			return nil, status.Errorf(
				codes.InvalidArgument,
				"invalud file_id: %s",
				err.Error(),
			)
		}
	} else {
		fileID, err = id.GenerateFileID()
		if err != nil {
			return nil, status.Error(codes.Internal, "invalud generate file_id")
		}
	}
	servers, err := s.storages.Servers.ListOfLessBusy(5)
	if err != nil {
		return nil, status.Errorf(
			codes.Internal,
			"list of less busy error: %s",
			err.Error(),
		)
	}
	if len(*servers) != 5 {
		return nil, status.Error(codes.Internal, "not found enough servers to store")
	}
	item := &files.File{
		NamespaceID: namespaceID,
		FileID:      fileID,
		Enabled:     req.Enabled,
		Finished:    false,
		Creator:     creator,
		Updater:     creator,
	}
	for _, server := range *servers {
		item.Servers = append(item.Servers, server.ServerID)
	}
	err = s.storages.Files.Add(item)
	if err != nil {
		if storages.CheckExists(err) {
			return nil, status.Errorf(codes.AlreadyExists, "namespace already exists")
		}
	}
	if err != nil {
		return nil, status.Errorf(codes.Internal, err.Error())
	}
	return &api.AddResponse{
		NamespaceId: namespaceID.String(),
		FileId:      fileID.String(),
		Servers:     item.GetServers(),
	}, nil
}
