# docker-rabbitmq

A rabbitmq docker image based on [RabbitMQ Official Image](https://hub.docker.com/_/rabbitmq) with some plugins enabled by default.

## Plugins Enabled

| Protocol       | Port  | Plugin                      |
|:---------------|:-----:|:----------------------------|
| AMQP           | 5672  | *base system*               |
| CLUSTERING     | 25672 |                             |
| HTTP (non-TLS) | 15672 | rabbitmq_management         |
| HTTP (non-TLS) | 15692 | rabbitmq_prometheus         |
| HTTP/WEB-MQTT  | 15675 | rabbitmq_web_mqtt           |
| HTTP/WEB-STOMP | 15674 | rabbitmq_web_stomp          |
| MQTT           | 1883  | rabbitmq_mqtt               |
| STOMP          | 61613 | rabbitmq_stomp              |

## References

-   [RabbitMQ Default Ports](https://www.rabbitmq.com/install-windows-manual.html#ports)
-   [RabbitMQ Plugins](https://www.rabbitmq.com/plugins.html#tier1-plugins)
-   [how-to-add-initial-users-when-starting-a-rabbitmq-docker-container](https://stackoverflow.com/questions/30747469/how-to-add-initial-users-when-starting-a-rabbitmq-docker-container)
-   [deploy-rabbitmq-with-docker-static-configuration](https://thomasdecaux.medium.com/deploy-rabbitmq-with-docker-static-configuration-23ad39cdbf39)

## Usage

### Docker CLI

```bash
# create a named volume to make easy docker volume management
docker volume create --driver local rabbitmq-volume

# create/run container
docker run --detach \
    --name rabbitmq \
    --hostname rabbitmq \
    --volume rabbitmq-volume:/var/lib/rabbitmq \
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
    --env RABBITMQ_ERLANG_COOKIE='EOzFBGMs1AK6E5QIat444' \
    --log-opt max-size=10m \
    --log-opt max-file=5 \
    pedrozc90/rabbitmq
```

> Access management interface http://localhost:15672

### Docker Composer

```bash
docker-compose --file ./docker-compose.yml up --detach
```

## License

Please, see [LICENSE](./LICENSE) file.
