format:
	gofmt -s -w ./

build:
	CGO_ENABLED=0 GOOS=${TARGETOS} GOARCH=${TARGETARCH} go build -v -o telebot
linux:
	CGO_ENABLED=0 GOOS=linux GOARCH=${shell dpkg --print-architecture} go build -v -o telebot
macOS:
	CGO_ENABLED=0 GOOS=macOS GOARCH=${shell dpkg --print-architecture} go build -v -o telebot
Windows:
	CGO_ENABLED=0 GOOS=Windows GOARCH=${shell dpkg --print-architecture} go build -v -o telebot


clean:
	rm -rf telebot	