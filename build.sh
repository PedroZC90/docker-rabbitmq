#!/bin/bash

sh normalize.sh

docker build --no-cache --file ./Dockerfile --tag pedrozc90/rabbitmq .
