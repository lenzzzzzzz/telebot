FROM --platform=$BUILDPLATFORM quay.io/projectquay/golang:1.23 AS build
ARG TARGETOS
ARG TARGETARCH
WORKDIR /go/src/app
COPY . .
RUN go get
RUN make build

ENTRYPOINT [ "./telebot" ]