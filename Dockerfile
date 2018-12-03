FROM golang:1.11-alpine as buildenv
ADD . /src
RUN cd /src && CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -a -installsuffix cgo -ldflags="-w -s" -o barryallen ./cmd/main.go

FROM alpine
RUN apk --no-cache add ca-certificates
WORKDIR /opt/
COPY --from=buildenv /src/barryallen .
ENTRYPOINT ./barryallen
