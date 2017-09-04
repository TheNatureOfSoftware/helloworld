FROM golang:1.8.3 as builder
WORKDIR /go/src/github.com/TheNatureOfSoftware/helloworld
COPY main.go .
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o app .

FROM scratch
COPY --from=builder /go/src/github.com/TheNatureOfSoftware/helloworld .
CMD ["./app"]

EXPOSE 8080