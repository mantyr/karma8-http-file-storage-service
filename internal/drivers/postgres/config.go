package postgres

import (
	"fmt"
	"time"

	"github.com/caarlos0/env/v6"
)

// Config это настройки подключения к базе данных
type Config struct {
	// Host это адрес базы данных
	Host string `env:"DB_HOST,required"`

	// Port это порт по которому доступна база данных
	Port int `env:"DB_PORT,required"`

	// Name это название базы данных
	Name string `env:"DB_NAME,required"`

	// Schema название схемы данных
	Schema string `env:"DB_SCHEMA" envDefault:"public"`

	// User это имя пользователя в базе данных
	User string `env:"DB_USER,required"`

	// Password это пароль пользователя в базе данных
	Password string `env:"DB_PASSWORD,required"`

	// MaxIdleConns устанавливает максимальное количество подключений в пуле незанятых подключений.
	MaxIdleConns int `env:"DB_MAX_IDLE_CONNS" envDefault:"5"`

	// MaxOpenConns устанавливает максимальное количество открытых подключений к базе данных.
	MaxOpenConns int `env:"DB_MAX_OPEN_CONNS" envDefault:"5"`

	// ConnMaxIdleTime устанавливает максимальное время простоя соединения
	ConnMaxIdleTime time.Duration `env:"DB_CONN_MAX_IDLE_TIME" envDefault:"300s"`

	// ConnMaxLifetime устанавливает максимальное количество времени, в течение которого соединение может быть повторно использовано
	ConnMaxLifetime time.Duration `env:"DB_CONN_MAX_LIFETIME" envDefault:"600s"`
}

func (db *Config) DSN() string {
	return fmt.Sprintf(
		"host=%s port=%d dbname=%s user=%s password=%s",
		db.Host,
		db.Port,
		db.Name,
		db.User,
		db.Password,
	)
}

// NewTestConfig возвращает настройки из переменных окружения
func NewTestConfig() (*Config, error) {
	conf := &Config{}
	err := env.Parse(conf)
	if err != nil {
		return nil, err
	}
	return conf, nil
}
