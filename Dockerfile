# references:
#   https://hub.docker.com/_/rabbitmq
#   https://github.com/thinkco/docker-rabbitmq

FROM rabbitmq:3.9.13-management-alpine

# defining enviroment variables
ENV RABBITMQ_VHOST development
ENV RABBITMQ_USERNAME admindev
ENV RABBITMQ_PASSWORD 1
ENV RABBITMQ_PID_FILE /var/lib/rabbitmq/mnesia/rabbitmq

# create a dedicated group and user
RUN addgroup -g 1000 runner \
    && adduser -u 1000 -G runner -s /bin/sh -D runner

RUN apk update \
    && apk add --no-cache --upgrade bash

# enableing rabbitmq plugins
RUN rabbitmq-plugins enable --offline \
    rabbitmq_auth_backend_cache \
    rabbitmq_auth_backend_http \
    rabbitmq_prometheus \
    rabbitmq_management \
    rabbitmq_management_agent \
    rabbitmq_mqtt \
    rabbitmq_stomp \
    rabbitmq_web_mqtt \
    rabbitmq_web_stomp

ADD init.sh /init.sh

RUN chmod +x /init.sh

COPY rabbitmq.conf /etc/rabbitmq/rabbitmq.conf

EXPOSE 1883 5671 5672 15672 15674 15675 15692 25672 61613

CMD [  "/init.sh" ]
