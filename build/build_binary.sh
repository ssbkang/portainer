binary="portainer"
mkdir -p dist

cd 'api/cmd/portainer'

go get -t -d -v ./...
GOOS=$1 GOARCH=$2 CGO_ENABLED=0 go build -a --installsuffix cgo --ldflags '-s'

ls -la

# mv "${binary}" "../../../dist/portainer"
