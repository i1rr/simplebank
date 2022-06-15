createdb:
	docker exec -it psql_db_1 createdb --username=i1rr --owner=i1rr simple_bank

dropdb:
	docker exec -it psql_db_1 dropdb simple_bank

migrateup:
	migrate -path db/migration -database "postgresql://i1rr:mysecretpassword@localhost:5432/simple_bank?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migration -database "postgresql://i1rr:mysecretpassword@localhost:5432/simple_bank?sslmode=disable" -verbose down

sqlc:
	sqlc generate


#.PHONY explicitly says to the system that commands aren't files,
# by default Makefile will look for files
.PHONY: createdb dropdb migrateup migratedown sqlc