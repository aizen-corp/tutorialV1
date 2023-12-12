select * from trip_fare_2_train_dataset
using_foresight_options
(
	{
    "query_type": "training",
    "model": { "name": "trip_fare_2_dl_model" },
    "dl_config":
    {
        "input_features": 
        [
          { "name": "pickup_zipcode", "type": "category" },
          { "name": "dropoff_zipcode", "type": "category" },
          { "name": "passenger_count", "type": "numerical"},
          { "name": "hourly_segment", "type": "category" },
          { "name": "is_holiday_or_weekend", "type": "numerical" },
          { "name": "pickup_geo_area", "type": "category" },
          { "name": "dropoff_geo_area", "type": "category" }
        ],
        "output_features": 
        [
          { "name": "fare_amount", "type": "numerical"}
        ]
    }
  }
)