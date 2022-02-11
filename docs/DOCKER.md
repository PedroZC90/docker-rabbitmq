# Docker

## Testing

```bash
# build docker image
docker build --no-cache \
    --file ./Dockerfile \
    --tag pedrozc90/rabbitmq \
    .
```

```bash
# run/creat docker container
# container will be removed with exit
docker run -it --rm \
    --name rabbitmq \
    --hostname rabbitmq \
    --volume rabbitmq-volume:/var/lib/rabbitmq \
    --publish 1883:1883
    --publish 5671:5671
    --publish 5672:5672
    --publish 15672:15672
    --publish 15674:15674
    --publish 15675:15675
    --publish 15692:15692
    --publish 25672:25672
    --publish 61613:61613
    --env RABBITMQ_DEFAULT_USER=pedrozc90
    --env RABBITMQ_DEFAULT_PASS=AeYreOty
    --env RABBITMQ_DEFAULT_VHOST=master
    --env RABBITMQ_ERLANG_COOKIE='EOzFBGMs1AK6E5QIat444' \
    --log-opt max-size=10m \
    --log-opt max-file=5 \
    pedrozc90/rabbitmq
```

## Container

```bash
# create a named volume to make easy docker volume management
docker volume create --driver local rabbitmq-volume

# run/create container
docker run --detach \
    --name rabbitmq \
    --hostname rabbitmq \
    --volume rabbitmq-volume:/var/lib/rabbitmq \
    --publish 5672:5672 \
    --publish 15672:15672 \
    --publish 15675:15675 \
    --env RABBITMQ_DEFAULT_USER=admin
    --env RABBITMQ_DEFAULT_PASS=admin
    --env RABBITMQ_DEFAULT_VHOST=admin
    --env RABBITMQ_ERLANG_COOKIE='EOzFBGMs1AK6E5QIat444' \
    --log-opt max-size=10m \
    --log-opt max-file=5 \
    rabbitmq:3.9.13-management-alpine
```

## Docker Hub

```bash
# build docker image
docker build --no-cache \
    --file ./Dockerfile \
    --tag pedrozc90/rabbitmq:1.0.0 \
    --tag pedrozc90/rabbitmq \
    .
```

```bash
# push to docker hub
docker push pedrozc90/rabbitmq
```
