package id

import (
	"github.com/google/uuid"
)

// SubjectID - идентификатор субъекта
type SubjectID struct {
	uuid.UUID
}

func GenerateSubjectID() (SubjectID, error) {
	id, err := uuid.NewRandom()
	return SubjectID{id}, err
}

func ParseSubjectID(id string) (SubjectID, error) {
	if id == "" {
		return SubjectID{}, nil
	}
	uid, err := uuid.Parse(id)
	if err != nil {
		return SubjectID{}, err
	}
	return SubjectID{uid}, nil
}

func (u SubjectID) IsZero() bool {
	return u.String() == "00000000-0000-0000-0000-000000000000"
}
