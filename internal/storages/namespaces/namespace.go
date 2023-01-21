package namespaces

import (
	"errors"
	"fmt"
	"time"

	"github.com/mantyr/karma8-http-file-storage-service/internal/id"
)

type Namespace struct {
	// NamespaceID это идентификатор пространства для хранения файлов
	NamespaceID id.NamespaceID

	// Enabled означает доступно ли пространство для использования
	Enabled bool

	// Creator это информация о субъекте который создал запись
	Creator id.Subject

	// Updater это информация о субъекте который обновил запись
	Updater id.Subject

	// CreatedAt это дата создания записи
	CreatedAt time.Time

	// UpdatedAt это дата последнего обновления записи
	UpdatedAt time.Time
}

func (n *Namespace) Check() error {
	switch {
	case n.NamespaceID.IsZero():
		return errors.New("empty namespace id")
	case n.CreatedAt.IsZero():
		return errors.New("empty namespace created_at")
	case n.UpdatedAt.IsZero():
		return errors.New("empty namespace updated_at")
	}
	err := n.Creator.Check()
	if err != nil {
		return fmt.Errorf("namespace creator error: %s", err.Error())
	}
	err = n.Updater.Check()
	if err != nil {
		return fmt.Errorf("namespace updater error: %s", err.Error())
	}
	return nil
}
