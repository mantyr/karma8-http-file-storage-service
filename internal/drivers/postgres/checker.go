package postgres

import (
	"strings"

	"github.com/lib/pq"
)

// CheckDuplicate возвращает true если в базе уже есть запись с PRIMARY KEY
func CheckDuplicate(err error) bool {
	if err == nil {
		return false
	}
	switch pqError := err.(type) {
	case *pq.Error:
		switch pqError.Code {
		case pq.ErrorCode("23505"):
			return true
		}
	}
	return strings.Contains(
		strings.ToLower(err.Error()),
		"duplicate key",
	)
}

// CheckConstraint возвращает true если ошибка это DUPLICATE KEY
// с ограничением constraint
func CheckConstraint(err error, constraint string) bool {
	switch pqError := err.(type) {
	case *pq.Error:
		if pqError.Code == pq.ErrorCode("23505") && pqError.Constraint == constraint {
			return true
		}
	}
	return false
}
