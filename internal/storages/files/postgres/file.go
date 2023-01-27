package postgres

import (
	"time"

	"github.com/lib/pq"

	"github.com/mantyr/karma8-http-file-storage-service/internal/id"
	"github.com/mantyr/karma8-http-file-storage-service/internal/id/subjects"
)

// File это описание объекта файла на стороне базы данных
type File struct {
	// NamespaceID это идентификатор пространства с файлами
	NamespaceID id.NamespaceID `gorm:"column:namespace_id"`

	// FileID это идентификатор файла внутри пространства с файлами
	FileID id.FileID `gorm:"column:file_id"`

	// Name это название файла в рамках окружения
	Name string `gorm:"column:file_name"`

	// Servers это перечень серверов на которых хранятся части файла
	Servers pq.StringArray `gorm:"column:servers;type:varchar(1000)[]"`

	// Enabled это общий выключатель файла для всех
	Enabled bool `gorm:"column:enabled"`

	// CreatorID это идентификатор субъекта который создал запись
	CreatorID id.SubjectID `gorm:"column:creator_id"`

	// CreatorType это тип субъекта создавшего запись
	CreatorType subjects.Type `gorm:"column:creator_type"`

	// CreatedAt это дата создания записи
	CreatedAt time.Time `gorm:"column:created_at"`

	// UpdaterID это идентификатор субъекта который последним обновил запись
	UpdaterID id.SubjectID `gorm:"column:updater_id"`

	// UpdaterType это тип субъекта обновившего запись последним
	UpdaterType subjects.Type `gorm:"column:updater_type"`

	// UpdatedAt это дата последнего обновления информации
	UpdatedAt time.Time `gorm:"column:updated_at"`
}

// TableName это реализация интерфейса gorm.Tabler
func (f *File) TableName() string {
	return "files"
}

func (f *File) SetServers(servers []id.ServerID) {
	var items []string
	for _, server := range servers {
		items = append(items, server.String())
	}
	f.Servers = items
}

func (f *File) GetServers() ([]id.ServerID, error) {
	var items []id.ServerID
	for _, serverID := range f.Servers {
		item, err := id.ParseServerID(serverID)
		if err != nil {
			return []id.ServerID{}, err
		}
		items = append(items, item)
	}
	return items, nil
}