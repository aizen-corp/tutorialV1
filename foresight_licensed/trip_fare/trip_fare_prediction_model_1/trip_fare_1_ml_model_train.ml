select * from trip_fare_1_train_dataset
using_foresight_options
(
	{
        "query_type": "training",
        "model": { "name": "trip_fare_1_ml_model" },
        "ml_config": 
        {
         "setup":
            {
                "type": "regression",
                "high_cardinality_features": ["pickup_zipcode", "dropoff_zipcode"],
                "categorical_features": ["pickup_zipcode", "dropoff_zipcode"],
                "target": "fare_amount",
                "numeric_features": ["passenger_count"],
                "date_features": ["pickup_datetime"]
            }   
        }
    }
)
