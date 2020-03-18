mkdir -p dist

cd 'api/cmd/portainer'

go get -t -d -v ./...
GOOS=$1 GOARCH=$2 CGO_ENABLED=0 go build -a --installsuffix cgo --ldflags '-s'

if [ $1 == "linux" ] then
  binary="portainer"
elif [ $1 == "windpws" ] then
  binary="portainer.exe"
fi

mv "${binary}" "../../../dist/portainer"
