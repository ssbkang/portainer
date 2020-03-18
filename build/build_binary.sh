#!/usr/bin/env bash
PLATFORM=$1
ARCH=$2

mkdir -p dist

cd 'api/cmd/portainer'

go get -t -d -v ./...
GOOS="${PLATFORM}" GOARCH="${ARCH}" CGO_ENABLED=0 go build -a --installsuffix cgo --ldflags '-s'

if [[ "${PLATFORM}" == "linux" ]]; then
  binary="portainer"
else
  binary="portainer.exe"
fi

mv "${binary}" "../../../dist/portainer"
