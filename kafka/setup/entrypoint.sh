#!/bin/bash

# Create the topic "web-events"
kafka-topics --create --bootstrap-server broker:9092 --topic web-events --partitions 3 --replication-factor 1

wait_for_schema_registry() {
    until curl -sSf -X GET http://schema-registry:8081/subjects >/dev/null; do
        echo "Waiting for schema registry to become available..."
        sleep 1
    done
}

# Call the function to wait for schema registry
wait_for_schema_registry

# Register the schema "web-vevents"
curl -X POST -H "Content-Type: application/vnd.schemaregistry.v1+json" \
    --data '{"schema": "{\"type\":\"record\",\"name\":\"event\",\"fields\":[{\"name\":\"sub_type\",\"type\":\"string\"},{\"name\":\"ip\",\"type\":\"string\"},{\"name\":\"client_timestamp\",\"type\":\"long\"},{\"name\":\"data\",\"type\":\"string\"}]}" }' \
    http://schema-registry:8081/subjects/web-events-value/versions