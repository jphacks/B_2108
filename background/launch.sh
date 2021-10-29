#!/bin/bash

sleep 15

cd notifier
go install -tags 'mysql' github.com/golang-migrate/migrate/v4/cmd/migrate@latest
migrate -database 'mysql://root:r00t-not1f1er@tcp(db:3306)/notifier?parseTime=true' -path db up
go run main.go
