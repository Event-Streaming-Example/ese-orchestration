#!/bin/bash

# Create the topic "click-events"
kafka-topics --create --bootstrap-server broker1:9092 --topic click-events --partitions 3 --replication-factor 1

# Create the topic "order-events"
kafka-topics --create --bootstrap-server broker1:9092 --topic order-events --partitions 3 --replication-factor 1

wait_for_schema_registry() {
    until curl -sSf -X GET http://schema-registry:8081/subjects >/dev/null; do
        echo "Waiting for schema registry to become available..."
        sleep 1
    done
}

# Call the function to wait for schema registry
wait_for_schema_registry

# Register the schema "click-events"
curl -X POST -H "Content-Type: application/vnd.schemaregistry.v1+json" \
    --data '{"schema": "{\"type\":\"record\",\"name\":\"click_event\",\"fields\":[{\"name\":\"sub_type\",\"type\":\"string\"},{\"name\":\"ip\",\"type\":\"string\"},{\"name\":\"client_timestamp\",\"type\":\"long\"},{\"name\":\"data\",\"type\":\"string\"}]}" }' \
    http://schema-registry:8081/subjects/click-events-value/versions

# Register the schema "order-events"
curl -X POST -H "Content-Type: application/vnd.schemaregistry.v1+json" \
    --data '{"schema": "{\"type\":\"record\",\"name\":\"order_event\",\"fields\":[{\"name\":\"sub_type\",\"type\":\"string\"},{\"name\":\"ip\",\"type\":\"string\"},{\"name\":\"client_timestamp\",\"type\":\"long\"},{\"name\":\"data\",\"type\":\"string\"}]}" }' \
    http://schema-registry:8081/subjects/order-events-value/versions