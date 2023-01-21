package id

import (
	"github.com/google/uuid"
)

// ServerID - идентификатор сервера
type ServerID struct {
	uuid.UUID
}

func GenerateServerID() (ServerID, error) {
	id, err := uuid.NewRandom()
	return ServerID{id}, err
}

func ParseServerID(id string) (ServerID, error) {
	if id == "" {
		return ServerID{}, nil
	}
	uid, err := uuid.Parse(id)
	if err != nil {
		return ServerID{}, err
	}
	return ServerID{uid}, nil
}

func (u ServerID) IsZero() bool {
	return u.String() == "00000000-0000-0000-0000-000000000000"
}
