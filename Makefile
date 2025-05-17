APP=$(shell basename $(shell git remote get-url origin))
REGISTRY=lenzzzzzzz
VERSION=$(shell git describe --tags --abbrev=0)-$(shell git rev-parse --short HEAD)
TARGETOS=linux
TARGETARCH=amd64

format:
	gofmt -s -w ./
get: 
	go get
lint:
	golint
test: 
	go test -v
build: format get
	CGO_ENABLED=0 GOOS=${TARGETOS} GOARCH=${shell dpkg --print-architecture} go build -v -o telebot -ldflags "-X="github.com/lenzzzzzzz/telebot/cmd.appVersion=${VERSION}
linux:
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -v -o telebot
macOS:
	CGO_ENABLED=0 GOOS=darwin GOARCH=amd64 go build -v -o telebot
Windows:
	CGO_ENABLED=0 GOOS=windows GOARCH=amd64 go build -v -o telebot
image:
	docker build . -t ${REGISTRY}/${APP}:${VERSION}-${TARGETARCH}
push: 
	docker push ${REGISTRY}/${APP}:${VERSION}-${TARGETARCH}
run:
	./telebot
clean:
	rm -rf telebot	

version: 
	echo ${VERSION}