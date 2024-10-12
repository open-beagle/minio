#!/bin/sh

git config --global --add safe.directory $PWD

set -ex

export TARGETPLATFORM=linux/amd64
xx-apk add perl
xx-go --wrap
make build
mkdir -p .bin/$TARGETPLATFORM
mv minio .bin/$TARGETPLATFORM/minio

export TARGETPLATFORM=linux/arm64
xx-apk add perl
xx-go --wrap
make build
mkdir -p .bin/$TARGETPLATFORM
mv minio .bin/$TARGETPLATFORM/minio
