#!/bin/bash

# Start an interactive Kafka producer for the energy_events topic
# Messages are typed manually and sent on ENTER

docker exec -it energy-streaming-platform-kafka-1 \
kafka-console-producer \
  --bootstrap-server localhost:9092 \
  --topic energy_events
