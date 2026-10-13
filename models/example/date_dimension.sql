with cte as (
    select 
        TO_TIMESTAMP(STARTED_AT) AS STARTED_AT,
        DATE(TO_TIMESTAMP(STARTED_AT)) AS DATE_STARTED_AT,
        HOUR(TO_TIMESTAMP(STARTED_AT)) AS HOUR_STARTED_AT,
        CASE 
            WHEN DAYNAME(TO_TIMESTAMP(STARTED_AT)) IN ('Sat','Sun')
            THEN 'WEEKEND'
            ELSE 'BUSINESSDAY'
        END AS DAY_TYPE,
        {{function1('STARTED_AT')}} AS STATION_OF_YEAR
    from {{ source('demo', 'bike') }}
)



select * from cte
