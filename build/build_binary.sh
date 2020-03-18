OS=$1
ARCH=$2

mkdir -p dist

cd 'api/cmd/portainer'

go get -t -d -v ./...
GOOS="${OS}" GOARCH="${ARCH}" CGO_ENABLED=0 go build -a --installsuffix cgo --ldflags '-s'

if [ "${OS}" == "linux" ]; then
  binary="portainer"
elif [ "${OS}" == "windows" ]; then
  binary="portainer.exe"
fi

mv "${binary}" "../../../dist/portainer"
