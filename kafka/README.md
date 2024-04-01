# [ESE-Kafka]

This component houses the Kafka Configuration

```shell
docker-compose -f ./kafka/docker-compose.yml -p ese-kafka up -d 
```

- **ESE Role:** streams events from the ese-client
- **Talks to:** ese-consmer who pulls from this stream
- **Number of instances:** 1
- **Number of Brokers:** 1

__Note:__

- For the Kafka, let the `post-setup` container exit successfully before using any Kafka entities.
- `post-setup` service will create the required topics and schemas for the rest of the services to use.

## Setting up UI

The UI for managing topics and schema is hosted at <http://localhost:8083>

For connecting to the Kafka Cluster from UI:
- Bootstratp server endpoint: <broker:9092>
- Schema Registry endpoint: <http://schema-registry:8081>