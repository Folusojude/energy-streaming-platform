#!/bin/bash

# Start a Kafka consumer that reads all messages from the beginning
# Useful for debugging and verification

docker exec -it energy-streaming-platform-kafka-1 \
kafka-console-consumer \
  --bootstrap-server localhost:9092 \
  --topic energy_events \
  --from-beginning
