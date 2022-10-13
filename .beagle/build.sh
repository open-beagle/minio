#!/bin/sh

set -x

GOARCH=amd64
make build
mkdir -p .bin/linux/$GOARCH
mv minio .bin/linux/$GOARCH/minio

GOARCH=arm64
make build
mkdir -p .bin/linux/$GOARCH
mv minio .bin/linux/$GOARCH/minio

GOARCH=ppc64le
make build
mkdir -p .bin/linux/$GOARCH
mv minio .bin/linux/$GOARCH/minio
