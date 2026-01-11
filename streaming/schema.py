from pyspark.sql.types import (
    StructType,
    StructField,
    StringType,
    DoubleType,
    TimestampType
)

energy_event_schema = StructType([
    StructField("meter_id", StringType(), nullable=False),
    StructField("region", StringType(), nullable=True),
    StructField("kwh", DoubleType(), nullable=False),
    StructField("event_time", TimestampType(), nullable=False),
])
