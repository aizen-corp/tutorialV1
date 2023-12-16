select * from trip_fare_1_train_dataset
using_foresight_options
(
	{
        "query_type": "training",
        "model": { "name": "trip_fare_1_dl_model" },
        "dl_config": {
            "input_features": [
                     { "name": "pickup_zipcode", "type": "category" },
                     { "name": "dropoff_zipcode", "type": "category" },
                     { "name": "passenger_count", "type": "number"}
            ],
            "output_features": [
              { "name": "fare_amount", "type": "number"}
            ],
            "trainer" : {
                "batch_size": 2048,
                "epochs": 100,
                "early_stop":5
            }
        }
    }
)