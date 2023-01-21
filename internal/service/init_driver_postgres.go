package service

import (
	"fmt"

	"github.com/urfave/cli/v2"

	"github.com/mantyr/karma8-http-file-storage-service/internal/drivers/postgres"
)

func (s *Service) InitDriverPostgres(ctx *cli.Context) (err error) {
	conf := &postgres.Config{
		Host:     ctx.String("db.host"),
		Port:     ctx.Int("db.port"),
		Name:     ctx.String("db.name"),
		Schema:   ctx.String("db.schema"),
		User:     ctx.String("db.user"),
		Password: ctx.String("db.password"),
	}
	s.Drivers.postgres, err = postgres.New(conf)
	if err != nil {
		return fmt.Errorf("db (postgres) connect error: %v", err.Error())
	}
	return nil
}

func (s *Service) StopDriverPostgres() error {
	err := s.Drivers.postgres.Close()
	if err != nil {
		return fmt.Errorf("db (postgres) stop driver error: %v", err.Error())
	}
	return nil
}
