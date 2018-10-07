FROM golang:latest as builder

ENV CGO_ENABLED=0
ENV GOOS=linux
ENV GOARCH=amd64
WORKDIR /go/src/github.com/yokoe/go-server-example
COPY . .
RUN go build main.go

# runtime image
FROM alpine
RUN apk add --no-cache ca-certificates
COPY --from=builder /go/src/github.com/yokoe/go-server-example /app
RUN ls /app
EXPOSE 8080
CMD /app/main
