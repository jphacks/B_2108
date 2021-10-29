#!/bin/bash

sleep 15

cd notifier
go install -tags 'mysql' github.com/golang-migrate/migrate/v4/cmd/migrate@latest
migrate -database "$MIGRATE_URL" -path db up
go run main.go
