package servers

import (
	"errors"
	"fmt"
	"time"

	"github.com/mantyr/karma8-http-file-storage-service/internal/id"
)

type Server struct {
	// ServerID это идентификатор сервера хранения файлов
	ServerID id.ServerID

	// Host это хост по которому отвечает сервер хранения файлов
	Host string

	// Port это порт по которому отвечает сервер хранения файлов
	Port int

	// Creator это информация о субъекте который создал запись
	Creator id.Subject

	// Updater это информация о субъекте который обновил запись
	Updater id.Subject

	// CreatedAt это дата создания записи
	CreatedAt time.Time

	// UpdatedAt это дата последнего обновления записи
	UpdatedAt time.Time
}

func (s *Server) Check() error {
	switch {
	case s.ServerID.IsZero():
		return errors.New("empty server id")
	case s.CreatedAt.IsZero():
		return errors.New("empty server created_at")
	case s.UpdatedAt.IsZero():
		return errors.New("empty server updated_at")
	}
	err := s.Creator.Check()
	if err != nil {
		return fmt.Errorf("server creator error: %s", err.Error())
	}
	err = s.Updater.Check()
	if err != nil {
		return fmt.Errorf("server updater error: %s", err.Error())
	}
	return nil
}
