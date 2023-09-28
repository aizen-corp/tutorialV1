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
                     { "name": "passenger_count", "type": "numerical",
                       "preprocessing": {"normalization":"zscore", "missing_value_strategy":"fill_with_mean"} },
                     { "name": "hourly_segment", "type": "category" },
                     { "name": "is_holiday_or_weekend", "type": "numerical" },
                     { "name": "pickup_geo_area", "type": "category" },
                     { "name": "dropoff_geo_area", "type": "category" },
                     { "name": "total_passenger_count_4hr", "type": "numerical",
                       "preprocessing": {"normalization":"zscore", "missing_value_strategy":"fill_with_const","fill_value":0} }
            ],
            "output_features": [
              { "name": "fare_amount", "type": "numerical",
                "num_fc_layers":4, "fc_size":128, "norm":"batch"}
            ],
            "trainer" : {
                "batch_size": 1024,
                "epochs": 150,
                "early_stop": 10,
                "learning_rate": 0.001,
                "optimizer": {"type": "adam"}
            }
        }
    }
)
