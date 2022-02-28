#!/bin/bash

sh normalize.sh

docker build --no-cache \
    --file ./Dockerfile \
    --tag pedrozc90/rabbitmq:test \
    .
    
docker run -it \
    --rm \
    --name rabbitmq \
    --hostname rabbitmq \
    --publish 1883:1883 \
    --publish 5671:5671 \
    --publish 5672:5672 \
    --publish 15672:15672 \
    --publish 15674:15674 \
    --publish 15675:15675 \
    --publish 15692:15692 \
    --publish 25672:25672 \
    --publish 61613:61613 \
    --env RABBITMQ_DEFAULT_USER=admin \
    --env RABBITMQ_DEFAULT_PASS=admin \
    --env RABBITMQ_DEFAULT_VHOST=admin \
    --log-opt max-size=10m \
    --log-opt max-file=5 \
    pedrozc90/rabbitmq:test sh
