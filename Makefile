TARGET=raspiBackupRESTListener
BIN_DIR=.
PLATFORM := $(shell uname -m)

default: build_$(PLATFORM)

all: build_x86_64 build_aarch64

setup:
	go mod init ${TARGET}
	go mod tidy

run:
	go run ${TARGET}.go

build_aarch64:
	OOS=linux GOARCH=arm GOARM=7 go build -o ${BIN_DIR}/${TARGET}_aarch64 ${TARGET}.go

build_x86_64:
	OOS=linux go build -o ${BIN_DIR}/${TARGET}_x86_64 ${TARGET}.go
