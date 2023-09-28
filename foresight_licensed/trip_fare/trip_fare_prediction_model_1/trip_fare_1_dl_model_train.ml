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
                     { "name": "passenger_count", "type": "number",
                       "preprocessing": {"normalization":"zscore", "missing_value_strategy":"fill_with_mean"} }
            ],
            "output_features": [
              { "name": "fare_amount", "type": "number",
                "num_fc_layers":4, "fc_size":128, "norm":"batch"}
            ],
            "trainer" : {
                "batch_size": 1024,
                "epochs": 150,
                "early_stop": 8,
                "learning_rate": 0.001,
                "optimizer": {"type": "adam"}
            }
        }
    }
)
