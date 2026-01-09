from pyspark.sql import SparkSession
from pyspark.sql.functions import from_json, col
from pyspark.sql.types import StructType, StructField, StringType, DoubleType, TimestampType

spark = (
    SparkSession.builder
    .appName("KafkaEventTime")
    .getOrCreate()
)

schema = StructType([
    StructField("meter_id", StringType()),
    StructField("region", StringType()),
    StructField("kwh", DoubleType()),
    StructField("event_time", TimestampType())
])

raw_stream = (
    spark.readStream
    .format("kafka")
    .option("kafka.bootstrap.servers", "kafka:9092")
    .option("subscribe", "energy_events")
    .option("startingOffsets", "earliest")
    .load()
)

parsed = (
    raw_stream
    .selectExpr("CAST(value AS STRING)")
    .select(from_json(col("value"), schema).alias("data"))
    .select("data.*")
)

query = (
    parsed.writeStream
    .format("console")
    .start()
)

query.awaitTermination()
