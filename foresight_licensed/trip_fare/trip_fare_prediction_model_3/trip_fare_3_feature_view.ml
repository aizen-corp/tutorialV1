select * from trip_fare_3_feature_view
using_foresight_options
(
    {
        "query_type": "featureview",
        "features": [
        {
            "feature_name": "hour_of_day",
            "expr": "pickup_datetime.getHours()"
        },
        {
            "feature_name": "calendar_day",
            "expr": "pickup_datetime.getCalendarDay()"
        },
        {
            "feature_name": "is_holiday_or_weekend",
            "featureset_name": "holiday_weekend_context",
            "source_features": ["is_holiday_or_weekend"]
        },
        {
            "feature_name": "hourly_segment",
            "featureset_name": "hour_of_day_context",
            "source_features": ["hourly_segment"]
        },
        {
            "feature_name": "pickup_geo_area",
            "featureset_name": "geo_area_context",
            "source_features": ["geo_area"],
            "entity_key_map": {"pickup_zipcode": "zipcode"}
        },
        {
            "feature_name": "dropoff_geo_area",
            "featureset_name": "geo_area_context",
            "source_features": ["geo_area"],
            "entity_key_map": {"dropoff_zipcode": "zipcode"}
        },
        {
            "feature_name": "total_passenger_count_4hr",
            "featureset_name": "trip_events_aggr1",
            "source_features": ["sum_passenger_count"],
            "window_start_time": "-4h",
            "window_end_time": "0d",
            "params": {"missing_value":0}
        }]
    }
)
