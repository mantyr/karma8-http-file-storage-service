// Package api это клиент для сервиса karma8 storage
package api

import (
	"crypto/tls"
	"errors"

	"google.golang.org/grpc"
	"google.golang.org/grpc/credentials"

	"github.com/mantyr/karma8-http-file-storage-service/api/karma8-storage/files"
)

// Config это настройки доступа к gRPC серверу
type Config struct {
	// Address это адрес gRPC сервера
	// Пример:
	//   "127.0.0.1:5300"
	Address string

	// Insecure отключает проверку SSL
	Insecure bool
}

// API это клиент к сервисам по gRPC
type API struct {
	conn *grpc.ClientConn

	Files      files.FileServiceClient
}

// New возвращает новый клиент к gRPC серверу
func New(conf *Config) (*API, error) {
	if conf == nil {
		return nil, errors.New("empty config")
	}
	opts := []grpc.DialOption{}
	if conf.Insecure {
		opts = append(opts, grpc.WithInsecure())
	}
	if conf.Insecure {
		opts = append(opts, grpc.WithInsecure())
	} else {
		cred := grpc.WithTransportCredentials(
			credentials.NewTLS(
				&tls.Config{
					MinVersion: tls.VersionTLS13,
				},
			),
		)
		opts = append(opts, cred)
	}
	conn, err := grpc.Dial(conf.Address, opts...)
	if err != nil {
		return nil, err
	}
	return &API{
		conn:       conn,
		Files:      files.NewFileServiceClient(conn),
	}, nil
}

// Close закрывает соединение с сервером
func (c *API) Close() error {
	return c.conn.Close()
}
