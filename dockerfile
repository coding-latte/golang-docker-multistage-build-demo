FROM golang

WORKDIR /go/src/github.com/coding-latte/golang-docker-multistage-build-demo

COPY . .

RUN go get .

RUN go build -o app .

CMD [ "./app" ]

EXPOSE 8080