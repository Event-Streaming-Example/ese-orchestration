#!/bin/bash

curl -X POST \
  -H 'Content-Type: application/vnd.schemaregistry.v1+json' \
  --data '{"schema": "{\"type\":\"record\",\"name\":\"event\",\"fields\":[{\"name\":\"sub_type\",\"type\":\"string\"},{\"name\":\"ip\",\"type\":\"string\"},{\"name\":\"client_timestamp\",\"type\":\"long\"},{\"name\":\"data\",\"type\":\"string\"}]}"}' \
  http://localhost:8081/subjects/web_events/versions
