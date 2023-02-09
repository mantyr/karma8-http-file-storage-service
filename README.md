# Karma8-http-file-storage-service

[![Software License](https://img.shields.io/badge/license-MIT-brightgreen.svg)](LICENSE.md)

Решение тестового задания. [В процессе разработки]

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

### Термины, определения и сокращения

> Inode - индексный дескриптор, который хранит метаданные о файлах, каталогах и других объектах файловой системы.
> В рамках файловой системы существует ограниченное количество inode.

> UUID (англ. universally unique identifier) - универсальный уникальный идентификатор.

### Архитектурный скетч

![karma8-http-file-storate-service-v1.drawio.svg](docs/karma8-http-file-storate-service-v1.drawio.svg "Общая схема взаимодействия сервисов и компонентов")

## Сервисы

| Сервис           | Описание |
| :--------------- | :------- |
| karma8 gw        | Принимает запросы от пользователей, проверяет доступ и делит файлы на части. При запросе файла собирает файл из частей полученных от сервиса `karma8 storage` |
| karma8 discovery | Хранит мета-информацию о файлах, список активных серверов хранения и пространства для хранения файлов                                                       |
| karma8 storage   | Хранит части файлов. Ничего не знает про содержимое файлов. Ничего не знает о других частях файла.

> **Note**
>
> Сервис `karma8 discovery` добавлен по следующим соображениям:
> 1. Более строгое разделение задач между сервисами
> 2. Облегчение сервиса `karma8 gw`
> 3. Возможность работы с сервисом `karma8 discovery` внутри более защищённого периметра для сервисных задач (таких как регистрация новых инстансов сервиса `karma8 storage`)

> **Note**
>
> Допущения:
> 1. Сервисы никак не обрабатывают ситуацию когда файл пытаются залить конкурентно два и более раз.
> 2. В процессе обновления файла старая версия не доступна для доступа
> 3. Если в процессе замены файла уже идёт чтение файла то такое поведение приводит к неожиданным последствиям
>
> Причины таких допущений:
> 1. Данный сервис лишь демонстрация (пример) структурирования кода
> 2. Данный сервис не предназначен для реального использования
> 3. Ограниченность времени которое разумно уделить на тестовое задание

## Сервис Karma8 Gateway

- Принимает запросы от пользователя
- Проверяет доступ на чтение файла во время запроса клиента (опционально)
- Проверяет доступ на запись файла во время запроса клиента (опционально)
- Делит входящие файлы на части для последующего сохранения в инстансах сервиса `karma8 storage`
- При запросе собирает файл из частей доступных на инстансах сервиса `karma8 storage`

> **Note**
> 
> Сервис не содержит реализации проверки прав доступа через IAM (Identity and Access Management), но для примера содержит пример доступности namespaces и files для доступа пользователям.

### Команда для запуска

```bash
karma8 gw --config=./config.yml
```

### Команда для получения справки

```bash
karma8 gw --help
```

### Правила разделения данных по нескольким серверам

| Engine    | Описание                           |
| :-------- | :-------                           |
| raid0     | Чередование серверов хранения      |
| raid1     | Зеркалирование серверов хранения   |

### Алгоритм при использовании raid0

| №  | Система источник | Система получатель | Описание действия |
| -- | :--------------- | :----------------- | :---------------- |
| 1  | Клиент           | karma8 gw          | Пользователь подключился к серверу по HTTP, передал заголовки и начал отправку файла                                                           |
| 2  | karma8 gw        | karma8 discovery   | GW сервис запросил информацию о пространстве для хранения файла, если пространство отсутствует или выключено - возвращает ошибку пользователю  |
| 3  | karma8 gw        | karma8 discovery   | GW сервис зарегистрировал новый файл, получив в ответ список серверов для хранения (порядок серверов важен)                                    |
| 4  | karma8 gw        | karma8 discovery   | GW сервис получил информацию о тех серверах хранения к которым ещё не подключен                                                                |
| 5  | karma8 gw        | karma8 storage's   | GW сервис подключился к серверам хранения (или переиспользовал ранее созданные соединения)                                                     |
| 6  | karma8 gw        | karma8 storage's   | GW сервис сформировал io.Writer (на основе engine.Raid0 ссылающегося на список соединений с серверами хранения) и начал копировать в него файл |
| 7  | karma8 storage   | file system        | Сервис хранения запишет поток данных в файл по адресу %namespace%/%name% где %name% это uid файла из базы данных karma8 discovery              |


### Что произойдёт если сервер хранения не сможет сохранить свою часть файла

- Сервис `karma8 storage` вернёт ошибку записи
- Сервис `karma8 gw` не отметит файл в `karma8 discovery` как закачанным полностью
- Сервис `karma8 gw` вернёт ошибку пользователю

### Что произойдёт если все сервера хранения смогут корректно записать свои части файла

- Сервисы `karma8 storage` вернут nil сервису `karma8 gw`
- Сервис `karma8 gw` дождётся ответа от всех сервисов karma8 storage и пометит файл как полностью записанным путём отправки события в сервис `karma8 discovery`
- Сервис `karma8 discovery` проставит дату финализации файла в своей базе данных
- Пользователь получит в качестве ответа от сервиса nil

## Сервис Karma8 Discovery

- Хранит мета-информацию о файлах и их частях
- Хранит перечень серверов хранения
- Хранит информацию о пространствах пользователя

> **Note**
> 
> Namespace выступают в качестве примера.
> В реальном продакшине вы, вероятно, захотите добавить такие объекты как customer, project и прочие, здесь же считаем что один customer это один namespace.

### Команда для запуска

```bash
karma8 discovery --config=./config.yml
```

### Команда для получения справки

```bash
karma8 discovery --help
```

### Миграции базы данных

Для миграций будем использовать утилиту [SQL-Migrate][sqlmigrate]

#### Настройки для утилиты миграции

Файд `dbconfig.yml` содержит настройки для утилиты миграции.

#### Команда для запуска миграций

```bash
make db.migrate.up
```

или

```bash
godotenv -f ./env/postgres.env sql-migrate up
```

## Сервис Karma8 Storage

- Хранит части файлов
- Ничего не знает о содержании файлов и алгоритме их разделения на части
- За хранение информации о том как файл был разделён и где находятся остальные части отвечает другой сервис - ]karma8 discovery]

### Команда для запуска

```bash
karma8 storage --config=./config.yml
```

### Команда для получения справки

```bash
karma8 storage --help
```

## Проблемы при хранении файлов

**Сервис хранения файлов имеет следующую специфику:**

- Огромное количество файлов
- Часто файлы не одинакового размера, либо слишком маленькие (меньше одного блока) или очень большие
- Заранее не известно какой размер файлов будет самым востребованным

В связи с этим надо отдельно поговорить о том как файлы будут храниться.

Простое решение - хранить каждый файл в отдельности.

**Это приведёт к следующим проблемам:**

- Ошибка `"No space left on device"` когда количество задействованных inode для описания файлов превысит ограничение файловой системы
- Ошибка `"No space left on device"` так же может появиться при огромном количестве файлов в одном каталоге т.к. это приводит к возникновению колизий в хеш-функции индекса каталога
- Так же не контролируемый рост количества файлов в одном каталоге приведёт к не возможности пользоваться каталогом по прямому назначению - читать файлы, просматривать список файлов и другое.

Решение чуть сложнее - хранить каждый файл в отдельности, но организовать ограничение по количеству файлов на один каталог.

Для этого решения нужно определить формат адреса файла, например у нас есть два значения: namespace в виде UUID и идентификатора файла в виде UUID.

Тогда адрес файла можно представить как набор вложеных каталогов следующим образом:

|           | Адрес файла |
| :-------- | :---------- |
| **Было**  | `78d720f3-d989-481a-815f-8fa315a54c65/55076ddf-7e29-48f0-b605-4d41a3146f66` |
| **Стало** | `78d720f3/d989/481a/815f/8fa315a54c65/55076ddf/7e29/48f0/b605/4d41a3146f66` |

> **Note**
>
> Разрешением файла можем пренебречь т.к. реальное название файла хранится не в сервисе `karma8 storage`, а в базе данных сервиса `karma8 discovery`

> **Note**
>
> Так же надо заметить что создание подкатологов увеличит количество используемых inode - по одному на каждый новый вложенный каталог

Чтож, решение не самое оптимальное для хранения большого количества мелких файлов. Мы попрежнему упираемся в количество inode доступных для использования.

Что бы невилировать проблему с количеством inode мы можем сгруппировать файлы по какому-то принципу в один большой файл.

**Варианты как это сделать:**

- Создать архив с файлами в глубине последнего каталога - потребуется архиватор поддерживающий два свойства: 1. хранение заголовков в начале файла 2. хранение содержимого без обязательного сжатия
- Создать формат хранения каталога в файле самостоятельно
- Выбрать готовое решение в виде базы данных
- Написать файловую систему для хранения файлов непосредственно на устройстве (hdd, ssd и прочие) - безусловно трудозатратный вариант, но и самый низкоуровневый

**Для целей решения тестовой задачи:**

Будем хранить файлы как есть, но применим вариант с вложенными каталогами.

Вариант с объединением файлов внутри каталога можно добавить в последствии при необходимости и включать соответствующим флагом.

## Процесс готовности

- [ ] `karma8 gw`
    - [ ] Приём файлов по HTTP
    - [ ] Отдача файлов по HTTP
    - [ ] Алгоритм разделения/сборки файла
        - [ ] nat0 - разделение файла на 5 потоков
    - [ ] Проверка доступа к файлу
        - [ ] По флагам доступности пространства и файла
- [ ] `karma8 discovery`
    - [ ] Функциональность
        - [ ] Пространства для хранения файлов
            - [ ] Регистрация нового пространства для хранения файлов
            - [ ] Отключение/Включение ранее зарегистрированного пространства для хранения файлов
            - [ ] Получение информации о пространстве для хранения файлов
        - [ ] Сервера хранения файлов
            - [ ] Регистрация нового сервера хранения файлов
            - [ ] Получение информации о сервере хранения файлов
        - [ ] Файлы
            - [ ] Регистрация нового файла
            - [ ] Выставление финального статуса для файла
            - [ ] Отключение/Включение ранее зарегистрированного файла
            - [ ] Получение информации о файле
    - [ ] Слой API
        - [x] namespaces
        - [x] files
        - [x] servers
    - [ ] Слой хранения данных
        - [x] namespaces
            - [x] реализация
            - [x] тесты
        - [x] files
            - [x] реализация
            - [x] тесты
        - [ ] servers
            - [ ] реализация
            - [ ] тесты
    - [ ] Слой миграций
        - [x] namespaces
        - [x] files
        - [x] servers
- [ ] `karma8 storage`
    - [ ] Функциональность
        - [ ] Получение файла по gRPC
        - [ ] Запись файла по gRPC
    - [ ] Слой API
        - [ ] files
    - [ ] Слой хранения файлов
- [ ] Сборка проекта в Dockerfile
- [ ] Сборка проекта в github CI

## Author

[Oleg Shevelev][mantyr]

[mantyr]: https://github.com/mantyr
[sqlmigrate]: https://github.com/rubenv/sql-migrate
