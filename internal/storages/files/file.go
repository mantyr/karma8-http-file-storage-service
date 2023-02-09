package files

import (
	"errors"
	"fmt"
	"time"

	"github.com/mantyr/karma8-http-file-storage-service/internal/id"
)

type File struct {
	// NamespaceID это идентификатор пространства для хранения файлов
	NamespaceID id.NamespaceID

	// FileID это идентификатор файла в рамках пространства
	FileID id.FileID

	// Name это название файла в рамках окружения
	Name string

	// Enabled означает доступен ли файл для использования
	Enabled bool

	// Finished означает что файл был залит на сервер полностью
	Finished bool

	// Size это размер файла
	Size int64

	// Servers это перечень серверов на которых хранятся части файла
	Servers []id.ServerID

	// Creator это информация о субъекте который создал запись
	Creator id.Subject

	// Updater это информация о субъекте который обновил запись
	Updater id.Subject

	// CreatedAt это дата создания записи
	CreatedAt time.Time

	// UpdatedAt это дата последнего обновления записи
	UpdatedAt time.Time
}

func (f *File) Check() error {
	switch {
	case f.NamespaceID.IsZero():
		return errors.New("empty file namespace id")
	case f.FileID.IsZero():
		return errors.New("empty file id")
	case f.Name == "":
		return errors.New("empty file name")
	case len(f.Servers) < 1:
		return errors.New("empty file servers")
	}
	for _, server := range f.Servers {
		if server.IsZero() {
			return errors.New("empty serverID in file servers")
		}
	}
	err := f.Creator.Check()
	if err != nil {
		return fmt.Errorf("file creator error: %s", err.Error())
	}
	err = f.Updater.Check()
	if err != nil {
		return fmt.Errorf("file updater error: %s", err.Error())
	}
	return nil
}
