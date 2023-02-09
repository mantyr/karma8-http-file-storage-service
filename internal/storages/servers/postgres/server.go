package postgres

import (
	"time"

	"github.com/mantyr/karma8-http-file-storage-service/internal/id"
	"github.com/mantyr/karma8-http-file-storage-service/internal/id/subjects"
)

// Server это описание объекта сервера хранения файлов на стороне базы данных
type Server struct {
	// ServerID это идентификатор сервера хранения данных
	ServerID id.ServerID `gorm:"column:server_id"`

	// Host по которому отвечает сервер хранения данных
	Host string `gorm:"column:host"`

	// Port по которому отвечает сервер хранения данных
	Port int `gorm:"column:port"`

	// StoredDataSize это размер данных которые хранятся на сервере
	StoredDataSize int64 `gorm:"column:stored_data_size"`

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
func (s *Server) TableName() string {
	return "servers"
}
