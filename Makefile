generate:
	go generate ./...

db.client:
	$(eval include ./env/postgres.env)
	PGPASSWORD="${POSTGRES_PASSWORD}" psql -h ${POSTGRES_HOST} -p ${POSTGRES_PORT} -U ${POSTGRES_USER} ${POSTGRES_DB}

db.start:
	docker-compose up -d

db.stop:
	docker-compose stop
	docker-compose rm -f
	docker volume rm -f karma8-http-file-storage-service_postgres-data

db.migrate.up:
	godotenv -f ./env/postgres.env sql-migrate up

db.migrate.down:
	godotenv -f ./env/postgres.env sql-migrate down

test:
	godotenv -f ./env/testing.env go test -count=1 -p 1 -v ./...

build:
	docker build -f ./Dockerfile --tag karma8-http-file-storage-service:$(version) .
