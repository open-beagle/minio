#!/bin/sh

set -x

export GOARCH=amd64
make build
mkdir -p .bin/linux/$GOARCH
mv minio .bin/linux/$GOARCH/minio

export GOARCH=arm64
make build
mkdir -p .bin/linux/$GOARCH
mv minio .bin/linux/$GOARCH/minio

export GOARCH=ppc64le
make build
mkdir -p .bin/linux/$GOARCH
mv minio .bin/linux/$GOARCH/minio
