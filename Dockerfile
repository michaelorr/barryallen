FROM golang:1.11-alpine as buildenv
ADD . /src
RUN cd /src && CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -a -installsuffix cgo -ldflags="-w -s" -o barryallen ./cmd/main.go

FROM scratch
COPY --from=buildenv /src/barryallen /opt/barryallen
ENTRYPOINT ["/opt/barryallen"]
