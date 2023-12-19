select * from trip_fare_3_train_dataset limit {{ var('row_limit', 'all') }}
using_foresight_options
(
	{
        "query_type": "training",
        "model": { "name": "trip_fare_3_dl_model" },
        "dl_config": {
            "input_features": [
                     { "name": "pickup_zipcode", "type": "category" },
                     { "name": "dropoff_zipcode", "type": "category" },
                     { "name": "passenger_count", "type": "numerical"},
                     { "name": "hourly_segment", "type": "category" },
                     { "name": "is_holiday_or_weekend", "type": "numerical" },
                     { "name": "pickup_geo_area", "type": "category" },
                     { "name": "dropoff_geo_area", "type": "category" },
                     { "name": "total_passenger_count_4hr", "type": "numerical"}
            ],
            "output_features": [
              { "name": "fare_amount", "type": "numerical"}
            ],
            "trainer" : {
                "batch_size": 2048,
                "epochs": 15,
                "early_stop": 1
            }
        }
    }
)
