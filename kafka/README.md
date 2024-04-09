# [ESE-Kafka]

This component houses the Kafka Configuration

```shell
export ESE_HOST_IP=192.168.29.191  && docker-compose -f ./kafka/docker-compose.yml -p ese-kafka up -d
```

- **ESE Role:** streams events from the ese-client
- **Talks to:** ese-consmer who pulls from this stream
- **Number of instances:** 1
- **Number of Brokers:** 2

## Setup note:

- For the Kafka, let the `post-setup` container exit successfully before using any Kafka entities.
- `post-setup` service will create the required topics and schemas for the rest of the services to use.
- Make sure the `ESE_HOST_IP` has the value same as the IP address as that of the machine on which it is running.

__Listener Configuration:__

3 Listeners are configured for each broker:

1. `DOCKER_LISTENER` : This is for the brokers to interract with zookeeper, schema-registry and the UI
2. `LOCAL_LISTENER` : This is to connect to Kafka cluster from the docker host machine
3. `EXTERNAL_LISTENER` : This is to connect to Kafka cluster over the shared network

### Connecting to Kafka locally

If the Kafka and the `ese-client` are running on the same machine, use the brokers given below to connect to Kafka:

```text
localhost:19092,localhost:29092
```

### Connecting to Kafka over the network

If the Kafka and the `ese-client` are running on the same machine, use the brokers given below to connect to Kafka. Provide the IP of the machin on which Kafka is running (`ESE_HOST_IP`)

```text
192.168.29.191:19093,192.168.29.191:29093
```

## Setting up UI

The UI for managing topics and schema is hosted at <http://localhost:8083>

For connecting to the Kafka Cluster from UI:
- Bootstratp server endpoint: <broker1:9092>, <broker2:9092>
- Schema Registry endpoint: <http://schema-registry:8081>