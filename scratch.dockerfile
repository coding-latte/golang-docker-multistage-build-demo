FROM golang as builder

WORKDIR /go/src/github.com/coding-latte/golang-docker-multistage-build-demo

COPY . .

RUN go get .

RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o app .

# deployment image
FROM scratch

# copy ca-certificates from builder
COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-certificates.crt

WORKDIR /bin/

COPY --from=builder /go/src/github.com/coding-latte/golang-docker-multistage-build-demo/app .

CMD [ "./app" ]

EXPOSE 8080