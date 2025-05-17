format:
	gofmt -s -w ./

build:
	CGO_ENABLED=0 GOOS=${TARGETOS} GOARCH=${TARGETARCH} go build -v -o telebot
linux:
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -v -o telebot
macOS:
	CGO_ENABLED=0 GOOS=darwin GOARCH=amd64 go build -v -o telebot
Windows:
	CGO_ENABLED=0 GOOS=windows GOARCH=amd64 go build -v -o telebot
image:
	docker build --build-arg TARGETOS=$(TARGETOS) \
	             --build-arg TARGETARCH=$(TARGETARCH) \
	             -t telebot:latest .

run:
	./telebot
clean:
	rmi telebot	