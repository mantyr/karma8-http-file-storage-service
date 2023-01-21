package storage

import (
	"github.com/mantyr/app"
	"github.com/mantyr/app/commands"
)

type Command struct {
	commands.Command
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
