package id

import (
	"github.com/google/uuid"
)

// FileID это идентификатор файла
type FileID struct {
	uuid.UUID
}

func GenerateFileID() (FileID, error) {
	id, err := uuid.NewRandom()
	return FileID{id}, err
}

func ParseFileID(id string) (FileID, error) {
	if id == "" {
		return FileID{}, nil
	}
	uid, err := uuid.Parse(id)
	if err != nil {
		return FileID{}, err
	}
	return FileID{uid}, nil
}

func (s FileID) IsZero() bool {
	return s.String() == "00000000-0000-0000-0000-000000000000"
}
