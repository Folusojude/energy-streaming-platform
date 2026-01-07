#!/bin/bash

docker exec -it energy-streaming-platform-kafka-1 \
kafka-topics \
  --bootstrap-server localhost:9092 \
  --create \
  --topic energy_events \
  --partitions 3 \
  --replication-factor 1
