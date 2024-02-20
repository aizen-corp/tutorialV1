select * from trip_fare_2_train_dataset
using_foresight_options
(
    {
        "query_type": "data-quality",
	"datetime_column": "pickup_datetime",
	"target_column": "fare_amount",
	"limit": -1,
        "report_format": "pdf"
    }
)
