module github.com/mantyr/karma8-http-file-storage-service

go 1.19

replace github.com/mantyr/karma8-http-file-storage-service/api/karma8-discovery v0.0.0 => ./api/karma8-discovery

replace github.com/mantyr/karma8-http-file-storage-service/api/karma8-storage v0.0.0 => ./api/karma8-storage

require (
	github.com/caarlos0/env/v6 v6.10.1
	github.com/google/uuid v1.3.0
	github.com/lib/pq v1.10.7
	github.com/mantyr/karma8-http-file-storage-service/api/karma8-discovery v0.0.0
	github.com/mantyr/karma8-http-file-storage-service/api/karma8-storage v0.0.0
	github.com/sirupsen/logrus v1.9.0
	gorm.io/driver/postgres v1.4.6
	gorm.io/gorm v1.24.3
)

require (
	github.com/BurntSushi/toml v1.2.1 // indirect
	github.com/cpuguy83/go-md2man/v2 v2.0.2 // indirect
	github.com/gin-contrib/sse v0.1.0 // indirect
	github.com/gin-gonic/gin v1.8.2 // indirect
	github.com/go-playground/locales v0.14.0 // indirect
	github.com/go-playground/universal-translator v0.18.0 // indirect
	github.com/go-playground/validator/v10 v10.11.1 // indirect
	github.com/goccy/go-json v0.9.11 // indirect
	github.com/golang/protobuf v1.5.2 // indirect
	github.com/gopherjs/gopherjs v0.0.0-20181017120253-0766667cb4d1 // indirect
	github.com/grpc-ecosystem/go-grpc-middleware v1.3.0 // indirect
	github.com/higebu/go-grpc-interceptor v1.0.3 // indirect
	github.com/jackc/pgpassfile v1.0.0 // indirect
	github.com/jackc/pgservicefile v0.0.0-20221227161230-091c0ba34f0a // indirect
	github.com/jackc/pgx/v5 v5.2.0 // indirect
	github.com/jinzhu/inflection v1.0.0 // indirect
	github.com/jinzhu/now v1.1.5 // indirect
	github.com/json-iterator/go v1.1.12 // indirect
	github.com/jtolds/gls v4.20.0+incompatible // indirect
	github.com/leodido/go-urn v1.2.1 // indirect
	github.com/mantyr/app v0.0.0-20230101001144-aee6cb0c9f88 // indirect
	github.com/mattn/go-isatty v0.0.16 // indirect
	github.com/modern-go/concurrent v0.0.0-20180306012644-bacd9c7ef1dd // indirect
	github.com/modern-go/reflect2 v1.0.2 // indirect
	github.com/pelletier/go-toml/v2 v2.0.6 // indirect
	github.com/renstrom/shortuuid v3.0.0+incompatible // indirect
	github.com/russross/blackfriday/v2 v2.1.0 // indirect
	github.com/smartystreets/assertions v1.2.0 // indirect
	github.com/smartystreets/goconvey v1.7.2 // indirect
	github.com/ugorji/go/codec v1.2.7 // indirect
	github.com/urfave/cli/v2 v2.23.7 // indirect
	github.com/xrash/smetrics v0.0.0-20201216005158-039620a65673 // indirect
	golang.org/x/crypto v0.4.0 // indirect
	golang.org/x/net v0.4.0 // indirect
	golang.org/x/sys v0.3.0 // indirect
	golang.org/x/text v0.5.0 // indirect
	google.golang.org/genproto v0.0.0-20221207170731-23e4bf6bdc37 // indirect
	google.golang.org/grpc v1.51.0 // indirect
	google.golang.org/protobuf v1.28.1 // indirect
	gopkg.in/yaml.v2 v2.4.0 // indirect
	gopkg.in/yaml.v3 v3.0.1 // indirect
)
