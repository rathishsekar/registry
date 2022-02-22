# Registry

`Build docker image`-  docker buildx build --platform=linux/amd64 -t registry:latest .

`Run docker image`-  docker run --platform=linux/amd64 -d -p 8080:8080 registry:latest
