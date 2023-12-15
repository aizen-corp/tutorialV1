select cast(pickup_datetime as timestamp) as pickup_datetime,pickup_zipcode, dropoff_zipcode, passenger_count, fare_amount,
       f.hourly_segment, f.is_holiday_or_weekend, f.pickup_geo_area, f.dropoff_geo_area
from
(
    select pickup_datetime,pickup_zipcode, dropoff_zipcode, passenger_count, fare_amount,
    {{ contextual_feature_fetch_udf('trip_fare_2_feature_view',
                                    'hourly_segment, is_holiday_or_weekend, pickup_geo_area, dropoff_geo_area') }} f 
    from {{ source('aws','trip_table') }}
) t
