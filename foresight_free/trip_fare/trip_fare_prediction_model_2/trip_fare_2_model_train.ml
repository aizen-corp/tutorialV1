select * from trip_fare_2_train_dataset
using_foresight_options
(
	{
        "query_type": "training",
        "model": { "name": "trip_fare_2_model" },
        "ml_config": 
        {
         "setup":
            {
                "type": "regression",
                "target": "fare_amount",
                "numeric_features": ["passenger_count","is_holiday_or_weekend"],
                "categorical_features": ["hour_of_day","pickup_zipcode","dropoff_zipcode","hourly_segment","pickup_geo_area","dropoff_geo_area","calendar_day"],
                "date_features": ["pickup_datetime"]
            }   
        }
    }
)
