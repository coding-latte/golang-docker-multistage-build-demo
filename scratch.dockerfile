FROM golang as builder

WORKDIR /go/github.com/coding-latte/golang-docker-multistage-build-demo

COPY . .

RUN go get .

RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o app .

# install ca-certificates
#RUN apk --update add ca-certificates


# deployment image
FROM scratch

# RUN apk --no-cache add ca-certificates

LABEL author="Maina Wycliffe"

COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-certificates.crt

WORKDIR /bin/

COPY --from=builder /go/github.com/coding-latte/golang-docker-multistage-build-demo/app .

CMD [ "./app" ]

EXPOSE 8080