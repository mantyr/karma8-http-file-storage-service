# karma8-discovery (v1)

Клиент к сервису karma8 discovery

- Не принимает запросы от пользователей напрямую

Сервер karma8 discovery предназначен:

- Для хранения информации о файлах
- Для хранения информации о доступных серверах хранения файлов
- Для хранения информации о пространствах для хранения файлов

### Описание файлов

- [`proto/`](proto)                       - proto файлы описывающие сервисы
- [`proto_vendor/`](proto_vendor)         - набор proto зависимостей

- [`karma8-discovery.pb`](karma8-discovery.pb)                     - grpc descriptor для envoy
- [`karma8-discovery.swagger.json`](karma8-discovery.swagger.json) - схема Swagger 2.0

- [`buf.gen.yaml`](buf.gen.yaml)   - настройка плагинов для утилиты buf
- [`buf.work.yaml`](buf.work.yaml) - настройка рабочего окружения для утилиты buf

### gRPC

- karma8.discovery.servers.v1.ServerService
- karma8.discovery.namespaces.v1.NamespaceService
- karma8.discovery.files.v1.FileService

### Установка зависимостей

<code>Зависимость | Версия
:-------- | :-------
[buf](https://github.com/bufbuild/buf)                                                                  | v1.4.0
[protoc-gen-go](https://github.com/golang/protobuf/protoc-gen-go)                                       | v1.5.2
[protoc-gen-go-grpc](https://google.golang.org/grpc/cmd/protoc-gen-go-grpc)                             | v1.2.0
[protoc-gen-openapiv2](https://github.com/grpc-ecosystem/grpc-gateway/tree/master/protoc-gen-openapiv2) | v2.10.0
</code>

```bash
make depend
```

### Сборка клиента

```bash
make build
```

### Отчистка репозитория от сгенерированных файлов

```bash
make clear
```
