select pickup_datetime, hour_of_day, calendar_day,
       pickup_zipcode, dropoff_zipcode, passenger_count, fare_amount,
       f.hourly_segment, f.is_holiday_or_weekend, f.pickup_geo_area, f.dropoff_geo_area
from
(
    select pickup_datetime, hour_of_day, calendar_day,
           pickup_zipcode, dropoff_zipcode, passenger_count, fare_amount,
    {{ contextual_feature_fetch_udf('trip_fare_2_feature_view',
                                    'hourly_segment, is_holiday_or_weekend, pickup_geo_area, dropoff_geo_area') }} f
    from
    (
        select from_utc_timestamp(pickup_datetime, "EST") as pickup_datetime,
               cast(hour(from_utc_timestamp(pickup_datetime, "EST")) as bigint) as hour_of_day,
               Date(from_utc_timestamp(pickup_datetime, "EST")) as calendar_day,
               pickup_zipcode, dropoff_zipcode, passenger_count, fare_amount
        from {{ source('aws','trip_table') }} limit 2000
    )
) t
