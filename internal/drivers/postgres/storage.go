package postgres

import (
	"errors"
	"fmt"
	"time"

	log "github.com/sirupsen/logrus"
	"gorm.io/driver/postgres"
	"gorm.io/gorm"
	"gorm.io/gorm/logger"
	"gorm.io/gorm/schema"
)

// Storage это реализация минимального хранилища от которого можно отнаследовать соединение
type Storage struct {
	db     *gorm.DB
	conf   *Config
	logger logger.Interface
}

func (s *Storage) DB() *gorm.DB {
	return s.db
}

func (s *Storage) Config() *Config {
	return s.conf
}

func (s *Storage) Logger() logger.Interface {
	return s.logger
}

// New возвращает новый Storage
func New(conf *Config) (*Storage, error) {
	if conf == nil {
		return nil, errors.New("empty config")
	}
	newLogger := logger.New(
		log.New(),
		logger.Config{
			SlowThreshold: 10 * time.Second, // Slow SQL threshold
			LogLevel:      logger.Silent,    // Log level
			Colorful:      true,             // Disable color
		},
	)
	db, err := gorm.Open(
		postgres.Open(conf.DSN()),
		&gorm.Config{
			Logger: newLogger,
			NamingStrategy: schema.NamingStrategy{
				TablePrefix:   conf.Schema + ".",
				SingularTable: true,
			},
		},
	)
	if err != nil {
		return nil, fmt.Errorf("gorm open db error: %v", err)
	}
	st := &Storage{
		db:     db,
		conf:   conf,
		logger: newLogger,
	}
	err = st.init()
	if err != nil {
		return nil, err
	}
	return st, nil
}

func (s *Storage) init() error {
	db, err := s.db.DB()
	if err != nil {
		return err
	}
	if db == nil {
		return errors.New("init error: empty storage db")
	}
	db.SetMaxIdleConns(s.conf.MaxIdleConns)
	db.SetMaxOpenConns(s.conf.MaxOpenConns)
	db.SetConnMaxIdleTime(s.conf.ConnMaxIdleTime)
	db.SetConnMaxLifetime(s.conf.ConnMaxLifetime)
	return nil
}

// Close закрывает содиенения с базой данных
func (s *Storage) Close() error {
	db, err := s.db.DB()
	if err != nil {
		return err
	}
	if db == nil {
		return errors.New("cancel error: empty storage db")
	}
	return db.Close()
}

// Check проверяет состояние подкдючения к хранилищу
func (s *Storage) Check() error {
	if s == nil || s.db == nil {
		return errors.New("empty storage")
	}
	db, err := s.db.DB()
	if err != nil {
		return err
	}
	if db == nil {
		return errors.New("empty storage db")
	}
	return db.Ping()
}

// Debug включает/выключает режим отладки
func (s *Storage) Debug(status bool) {
	if status {
		s.logger.LogMode(logger.Info)
	} else {
		s.logger.LogMode(logger.Silent)
	}
}
