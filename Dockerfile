# Golang compilcation done here
FROM golang:1.12 as compile
RUN mkdir /src
COPY main.go /src/
WORKDIR /src
RUN go mod init
RUN GOOS=linux GOARCH=amd64 \
	go build -ldflags='-linkmode external -w -extldflags "-static"' \
	-a -installsuffix cgo -o /web main.go
RUN ls -alh /web

# Run the executable here 
FROM busybox
COPY --from=compile /web /web
VOLUME /static
VOLUME /conf
EXPOSE 3000
WORKDIR /
ENTRYPOINT ["/web"]
