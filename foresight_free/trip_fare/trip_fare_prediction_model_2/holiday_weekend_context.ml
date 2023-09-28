select * from {{ source("aws", "holiday_weekend_context") }}
using_foresight_options
(
    {
        "query_type": "featureset",
        "entities": ["calendar_day"]
    }
)
