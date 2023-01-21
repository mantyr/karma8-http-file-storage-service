package subjects

import (
	"fmt"
)

// Перечень типов субъектов
const (
	User           Type = "user"
	ServiceAccount Type = "service_account"
)

// Type это тип субъекта
type Type string

func (t Type) Check() error {
	switch t {
	case User:
	case ServiceAccount:
	default:
		return fmt.Errorf("unexpected subject type (%s)", t)
	}
	return nil
}
