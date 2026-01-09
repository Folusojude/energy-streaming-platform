#!/bin/bash

# Run Spark Structured Streaming job that reads from Kafka
# Assumes Spark and Kafka containers are running

docker exec -it spark \
  /opt/spark/bin/spark-submit \
  --conf spark.jars.ivy=/tmp/ivy-cache \
  --packages org.apache.spark:spark-sql-kafka-0-10_2.12:3.5.0 \
  /opt/spark/work-dir/read_kafka.py
