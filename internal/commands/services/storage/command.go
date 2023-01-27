package storage

import (
	"github.com/mantyr/app"
	"github.com/mantyr/app/commands"
	"github.com/mantyr/starter"

	"github.com/mantyr/karma8-http-file-storage-service/internal/service"
)

type Command struct {
	commands.Command
	service *service.Service
}

func New() *Command {
	return &Command{}
}

func (c *Command) Init() error {
	c.Command.Name = "storage"
	c.Command.Usage = "File storage service"
	c.Command.Description = "File storage service (chunks)"
	return nil
}

func (c *Command) Subcommands() []app.Command {
	return []app.Command{}
}

func (c *Command) Action(ctx *cli.Context) error {
	s, err := starter.New()
	if err != nil {
		return err
	}
	s.Signals(
		syscall.SIGINT,
		syscall.SIGTERM,
	).Init(
		ctx,
		c.service.GRPC,
	).RunServices(
		ctx,
		c.service.GRPC,
	).Wait(ctx)
	return nil
}