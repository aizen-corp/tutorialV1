select * from {{ source("aws", "trip_table") }}
using_foresight_options
(
    {
        "query_type": "featureset",
        "entities": ["pickup_zipcode","dropoff_zipcode","pickup_longitude",
                     "pickup_latitude","dropoff_longitude","dropoff_latitude"],
        "min_aggregation_interval": "1h",
        "timestamp_column": "pickup_datetime",
        "backfill_start_datetime": "2022-10-15 00:00:00.000"
    }
)