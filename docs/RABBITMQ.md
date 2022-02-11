# RabbitMQ

## Create Users

```bash
# open rabbitmq docker console
docker exec -it rabbitmq bash

rabbitmqctl add_user admin rba9mcQLz8dQr9LL \
&& rabbitmqctl set_user_tags admin administrator \
&& rabbitmqctl set_permissions -p / admin "." "." ".*"
```

## Create New VHost

```bash
# open rabbitmq docker console
docker exec -it rabbitmq bash

rabbitmqctl add_vhost dev \
&& rabbitmqctl add_user admindev 5jJYVDCja3uRYfRS \
&& rabbitmqctl set_user_tags admindev administrator \
&& rabbitmqctl set_permissions -p dev admindev "." "." ".*"
```

## Plugins

```bash
# list of rabbitmq plugins available locally as well as their status.
rabbitmq-plugins list
```

## VHost

```bash
rabbitmqctl list_vhosts
```

## Utilities

```bash
VHOST=dev

# list all queues from a vhost
rabbitmqctl list_queues --silent --vhost $VHOST name state messages

# delete all queues from a vhost
for queue in $(rabbitmqctl list_queues --silent --vhost $VHOST name); do rabbitmqctl delete_queue --vhost $VHOST $queue; done
```
