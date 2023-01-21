package id

import (
	"github.com/google/uuid"
)

// NamespaceID это идентификатор пространства для хранения файлов
type NamespaceID struct {
	uuid.UUID
}

func GenerateNamespaceID() (NamespaceID, error) {
	id, err := uuid.NewRandom()
	return NamespaceID{id}, err
}

func ParseNamespaceID(id string) (NamespaceID, error) {
	if id == "" {
		return NamespaceID{}, nil
	}
	uid, err := uuid.Parse(id)
	if err != nil {
		return NamespaceID{}, err
	}
	return NamespaceID{uid}, nil
}

func (s NamespaceID) IsZero() bool {
	return s.String() == "00000000-0000-0000-0000-000000000000"
}
