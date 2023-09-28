select * from trip_fare_3_train_dataset limit {{ var('limit', 'all') }}
using_foresight_options
(
	{
        "query_type": "training",
        "model": { "name": "trip_fare_3_ml_model" },
        "ml_config": 
        {
         "setup":
            {
                "type": "regression",
                "high_cardinality_features": ["pickup_zipcode", "dropoff_zipcode"],
                "target": "fare_amount",
                "numeric_features": ["passenger_count","is_holiday_or_weekend","total_passenger_count_4hr"],
                "categorical_features": ["pickup_zipcode","dropoff_zipcode","hourly_segment","pickup_geo_area","dropoff_geo_area"],
                "date_features": ["pickup_datetime"]
            }   
        }
    }
)
