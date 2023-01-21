package postgres

import (
	"time"

	"github.com/mantyr/karma8-http-file-storage-service/internal/id"
	"github.com/mantyr/karma8-http-file-storage-service/internal/id/subjects"
)

// File это описание объекта файла на стороне базы данных
type File struct {
	// NamespaceID это идентификатор пространства с файлами
	NamespaceID id.NamespaceID `gorm:"column:namespace_id"`

	// FileID это идентификатор файла внутри пространства с файлами
	FileID id.FileID `gorm:"column:file_id"`

	// Servers это перечень серверов на которых хранятся части файла
	Servers []id.ServerID `gorm:"column:servers"`

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
