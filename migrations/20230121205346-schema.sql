
-- +migrate Up

CREATE TYPE SUBJECT_TYPE AS ENUM (
    'user',
    'service_account'
);

CREATE TABLE IF NOT EXISTS servers (
    server_id    UUID         NOT NULL,

    host        VARCHAR(1000) NOT NULL,
    port        INTEGER       NOT NULL,

    stored_data_size BIGINT   NOT NULL,

    creator_id   UUID         NOT NULL,
    creator_type SUBJECT_TYPE NOT NULL,

    updater_id   UUID         NOT NULL,
    updater_type SUBJECT_TYPE NOT NULL,

    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,

    PRIMARY KEY (server_id)
);

CREATE TABLE IF NOT EXISTS namespaces (
    namespace_id UUID         NOT NULL,

    enabled      bool         NOT NULL,

    creator_id   UUID         NOT NULL,
    creator_type SUBJECT_TYPE NOT NULL,

    updater_id   UUID         NOT NULL,
    updater_type SUBJECT_TYPE NOT NULL,

    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,

    PRIMARY KEY (namespace_id)
);

CREATE TABLE IF NOT EXISTS files (
    namespace_id UUID         NOT NULL,
    file_id      UUID         NOT NULL,
    file_name    varchar(10000) NOT NULL,

    servers      UUID[]       NOT NULL,
    enabled      bool         NOT NULL,
    finished     bool         NOT NULL,

    creator_id   UUID         NOT NULL,
    creator_type SUBJECT_TYPE NOT NULL,

    updater_id   UUID         NOT NULL,
    updater_type SUBJECT_TYPE NOT NULL,

    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,

    PRIMARY KEY (namespace_id, file_id)
);

CREATE UNIQUE INDEX IF NOT EXISTS file_name_idx ON files (namespace_id, file_name);

-- +migrate Down

DROP TABLE IF EXISTS servers;
DROP TABLE IF EXISTS namespaces;
DROP TABLE IF EXISTS files;
DROP INDEX IF EXISTS file_name_idx;
DROP TYPE IF EXISTS SUBJECT_TYPE;
