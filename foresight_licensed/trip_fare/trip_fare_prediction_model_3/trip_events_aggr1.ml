select * from {{ featureset_source("trip_events_context") }}
using_foresight_options
(
    {
        "query_type": "featureset",
        "entities": ["pickup_zipcode"],
        "max_aggregation_window": "1d",
        "aggregates": 
        [
            {
                "name": "sum_passenger_count",
                "function": "sum",
                "source_expr": "passenger_count"
            }
        ],
        "aggr_start_datetime": "2022-10-15 00:00:00.000"
    }
)