# Karma8-http-file-storage-service

[![Software License](https://img.shields.io/badge/license-MIT-brightgreen.svg)](LICENSE.md)

Решение тестового задания.

## Задача

Вы разрабатываете сервис хранения файлов.

На сервер по HTTP PUT присылают файл, его надо разрезать на 5 равных частей и сохранить на 5 серверах хранения. При запросе HTTP GET нужно достать куски, склеить и отдать файл.

### Имеем следующее

- Один сервер для HTTP-запросов
- Несколько серверов (>5) для хранения кусков файлов

### Ограничения
- Реализовать тестовый модуль для сервиса, который обеспечит
проверку его функционала
- Сервера для хранения могут добавляться в систему в любой момент, но не могут удаляться из системы
- Предусмотреть равномерное заполнение серверов хранения
- Можно задавать вопросы и уточнять условия задачи
- Код разместить в Github
- Код может быть несовершенным — нам важно понять образ вашего мышления и подходов к решению задачи

## Проработка решения

### Архитектурный скетч

![karma8-http-file-storate-service-v1.drawio.svg](docs/karma8-http-file-storate-service-v1.drawio.svg "Общая схема взаимодействия сервисов и компонентов")

## Сервисы

| Сервис           | Описание |
| :--------------- | :------- |
| karma8 gw        | Принимает запросы от пользователей, проверяет доступ и делит файлы на части. При запросе файла собирает файл из частей полученных от сервиса karma8 storage |
| karma8 discovery | Хранит мета-информацию о файлах, список активных серверов хранения и пространства для хранения файлов                                                       |
| karma8 storage   | Хранит части файлов. Ничего не знает про содержимое файлов. Ничего не знает о других частях файла.

## Сервис

### karma8 gw

- Принимает запросы от пользователя
- Проверяет доступ на чтение файла во время запроса клиента (опционально)
- Проверяет доступ на запись файла во время запроса клиента (опционально)

> **Note**
> 
> Сервис не содержит реализации проверки прав доступа через IAM (Identity and Access Management), но для примера содержит пример доступности namespaces и files для доступа пользователям.

#### Команда для запуска

```bash
karma8 gw --config=./config.yml
```

##### Команда для получения справки

```bash
karma8 gw --help
```

##### Правила разделения данных по нескольким серверам

| Engine    | Описание                           |
| :-------- | :-------                           |
| raid0     | Чередование серверов хранения      |
| raid1     | Зеркалирование серверов хранения   |

###### Алгоритм при использовании raid0

| №  | Система источник | Система получатель | Описание действия |
| -- | :--------------- | :----------------- | :---------------- |
| 1  | Клиент           | karma8 gw          | Пользователь подключился к серверу по HTTP, передал заголовки и начал отправку файла                                                           |
| 2  | karma8 gw        | karma8 discovery   | GW сервис запросил информацию о пространстве для хранения файла, если пространство отсутствует или выключено - возвращает ошибку пользователю  |
| 3  | karma8 gw        | karma8 discovery   | GW сервис зарегистрировал новый файл, получив в ответ список серверов для хранения (порядок серверов важен)                                    |
| 4  | karma8 gw        | karma8 discovery   | GW сервис получил информацию о тех серверах хранения к которым ещё не подключен                                                                |
| 5  | karma8 gw        | karma8 storage's   | GW сервис подключился к серверам хранения (или переиспользовал ранее созданные соединения)                                                     |
| 6  | karma8 gw        | karma8 storage's   | GW сервис сформировал io.Writer (на основе engine.Raid0 ссылающегося на список соединений с серверами хранения) и начал копировать в него файл |
| 7  | karma8 storage   | file system        | Сервис хранения запишет поток данных в файл по адресу %namespace%/%name% где %name% это uid файла из базы данных karma8 discovery              |


###### Что произойдёт если сервер хранения не сможет сохранить свою часть файла

- Сервис karma8 storage вернёт ошибку записи
- Сервис karma8 gw не отметит файл в karma8 discovery как закачанным полностью
- Сервис karma8 gw вернёт ошибку пользователю

###### Что произойдёт если все сервера хранения смогут корректно записать свои части файла

- Сервисы karma8 storage вернут nil сервису karma8 gw
- Сервис karma8 gw дождётся ответа от всех сервисов karma8 storage и пометит файл как полностью записанным путём отправки события в сервис karma8 discovery
- Сервис karma8 discovery проставит дату финализации файла в своей базе данных
- Пользователь получит в качестве ответа от сервиса nil

#### karma8 discovery

- Хранит мета-информацию о файлах и их частях
- Хранит перечень серверов хранения
- Хранит информацию о пространствах пользователя

> **Note**
> 
> Namespace выступают в качестве примера.
> В реальном продакшине вы, вероятно, захотите добавить такие объекты как customer, project и прочие, здесь же считаем что один customer это один namespace.

##### Команда для запуска

```bash
karma8 discovery --config=./config.yml
```

##### Команда для получения справки

```bash
karma8 discovery --help
```

#### karma8 storage

- Хранит части файлов
- Ничего не знает о содержании файлов и алгоритме их разделения на части
- За хранение информации о том как файл был разделён и где находятся остальные части отвечает другой сервис - karma8 discovery

##### Команда для запуска

```bash
karma8 storage --config=./config.yml
```

##### Команда для получения справки

```bash
karma8 storage --help
```

##### Проблемы при хранении файлов

> Inode - индексный дескриптор, который хранит метаданные о файлах, каталогах и других объектах файловой системы.
> В рамках файловой системы существует ограниченное количество inode.

## Author

[Oleg Shevelev][mantyr]

[mantyr]: https://github.com/mantyr
