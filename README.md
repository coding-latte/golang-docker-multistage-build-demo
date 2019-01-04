# Golang – Small Docker Images using Multistage Building

To run this demo:

1. Clone this repo `git clone https://github.com/coding-latte/golang-docker-multistage-build-demo.git`
2. then, run `docker build --rm -f "scratch.dockerfile" -t demo:latest .` to build the docker image using scratch
3. then, run the docker image `docker run --rm -d -p 8080:8080/tcp golang-docker-multistage-build-scratch-demo:latest`
4. open your browser and navigate to [localhost:8080](http://localhost:8080)

For more information about this repo, please visit the accompanying article [here](https://link)
