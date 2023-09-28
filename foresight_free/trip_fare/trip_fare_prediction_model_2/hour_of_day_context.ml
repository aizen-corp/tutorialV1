select * from {{ source("aws", "hour_of_day_context") }}
using_foresight_options
(
    {
        "query_type": "featureset",
        "entities": ["hour_of_day"]
    }
)
