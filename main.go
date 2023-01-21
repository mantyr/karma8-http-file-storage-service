package main

import (
	"os"

	"github.com/mantyr/app"

	"github.com/mantyr/karma8-http-file-storage-service/internal/commands/services/gw"
	"github.com/mantyr/karma8-http-file-storage-service/internal/commands/services/discovery"
	"github.com/mantyr/karma8-http-file-storage-service/internal/commands/services/storage"
)

var (
	versionInfo = "dev"
)

func main() {
	app := app.New()
	app.Name = "karma8"
	app.Usage = "HTTP File Storage service"
	app.Version = versionInfo
	app.Description = "File storage service example"
	app.Register(
		gw.New(),
		discovery.New(),
		storage.New(),
	)
	app.RunAndFatal(os.Args)
}
