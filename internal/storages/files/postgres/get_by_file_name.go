package postgres

import (
	"errors"
	"fmt"

	"gorm.io/gorm"

	"github.com/mantyr/karma8-http-file-storage-service/internal/id"
	"github.com/mantyr/karma8-http-file-storage-service/internal/storages"
	"github.com/mantyr/karma8-http-file-storage-service/internal/storages/files"
)

// GetByFileName возвращает информацию о файле по названию файла
func (s *Storage) GetByFileName(
	namespaceID id.NamespaceID,
	fileName string,
) (
	*files.File,
	error,
) {
	switch {
	case namespaceID.IsZero():
		return nil, errors.New("empty namespaceID")
	case fileName == "":
		return nil, errors.New("empty fileName")
	}
	item := &File{}
	err := s.db.Where(
		`
			namespace_id = ?
			AND file_name = ?
		`,
		namespaceID,
		fileName,
	).First(item).Error
	if err != nil {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			return nil, storages.NewNotFound(
				fmt.Errorf(
					"file not found (namespace_id=%s, file_name=%s)",
					namespaceID.String(),
					fileName,
				),
			)
		}
		return nil, err
	}
	servers, err := item.GetServers()
	if err != nil {
		return nil, err
	}
	result := &files.File{
		NamespaceID: item.NamespaceID,
		FileID:      item.FileID,
		Name:        item.Name,
		Servers:     servers,
		Enabled:     item.Enabled,
		Finished:    item.Finished,
		Size:        item.Size,
		Creator:     id.Subject{ID: item.CreatorID, Type: item.CreatorType},
		Updater:     id.Subject{ID: item.UpdaterID, Type: item.UpdaterType},
		CreatedAt:   item.CreatedAt,
		UpdatedAt:   item.UpdatedAt,
	}
	return result, nil
}
