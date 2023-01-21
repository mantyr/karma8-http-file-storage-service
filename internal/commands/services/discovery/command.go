package discovery

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
	c.Command.Name = "discovery"
	c.Command.Usage = "Discovery service"
	c.Command.Description = "Service for storing information about data storage servers"
	return nil
}

func (c *Command) Subcommands() []app.Command {
	return []app.Command{}
}
