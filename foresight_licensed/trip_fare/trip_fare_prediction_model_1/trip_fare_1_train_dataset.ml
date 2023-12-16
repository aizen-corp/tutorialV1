select cast(pickup_datetime as timestamp) as pickup_datetime,
       pickup_zipcode, dropoff_zipcode, passenger_count, fare_amount
from {{ source('aws','trip_table') }}

