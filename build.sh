#!/usr/bin/bash

env GOOS=linux GOARCH=amd64 go build -o ./bin/dotfilesInstaller-amd64 ./installer/main.go

env GOOS=linux GOARCH=arm64 go build -o ./bin/dotfilesInstaller-arm64 ./installer/main.go