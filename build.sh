#!/usr/bin/bash

env GOOS=linux GOARCH=amd64 go build -o ./bin/dotfilesInstaller-amd64 ./installer/main.go

env GOOS=linux GOARCH=arm64 go build -o ./bin/dotfilesInstaller-arm64 ./installer/main.go

cd ./bin/

sha256sum dotfilesInstaller-amd64 > dotfilesInstaller-amd64_sha256sum.txt
sha256sum dotfilesInstaller-arm64 > dotfilesInstaller-arm64_sha256sum.txt

zip dotfilesInstaller-amd64 dotfilesInstaller-amd64 dotfilesInstaller-amd64_sha256sum.txt
zip dotfilesInstaller-arm64 dotfilesInstaller-arm64 dotfilesInstaller-arm64_sha256sum.txt