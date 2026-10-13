with trips as (
    select 
        ride_id,
        rideable_type,
        date(to_timestamp(started_at)) as trip_date,
        start_statio_id as start_station_id,
        end_station_id,
        member_csual as memebr_casual,
        TIMESTAMPDIFF(SECOND, to_timestamp(started_at), to_timestamp(ended_at) ) as trip_duration_seconds
    from {{ source('demo', 'bike') }}
    
)

select * from trips