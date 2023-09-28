select * from {{ source("aws", "geo_area_context") }}
using_foresight_options
(
    {
        "query_type": "featureset",
        "entities": ["zipcode"]
    }
)
