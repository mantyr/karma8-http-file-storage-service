package gw

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
	c.Command.Name = "gw"
	c.Command.Usage = "HTTP gateway for file storage"
	c.Command.Description = "HTTP gateway for file storage"
	return nil
}

func (c *Command) Subcommands() []app.Command {
	return []app.Command{}
}
