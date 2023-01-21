package id

import (
	"errors"

	"github.com/mantyr/karma8-http-file-storage-service/internal/id/subjects"
)

type Subject struct {
	ID   SubjectID
	Type subjects.Type
}

func NewSubject(subjectID, subjectType string) (s Subject, err error) {
	s.ID, err = ParseSubjectID(subjectID)
	if err != nil {
		return s, err
	}
	s.Type = subjects.Type(subjectType)
	return s, s.Check()
}

func (s Subject) Check() error {
	if s.ID.IsZero() {
		return errors.New("empty subject_id")
	}
	return s.Type.Check()
}
