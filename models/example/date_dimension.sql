WITH CTE AS (
Select to_timestamp(Started_AT),
DATE(to_timestamp(Started_AT)) AS DATE_STARTED_AT,
HOUR(to_timestamp(Started_AT)) AS HOUR_STARTED_AT, 
{{ day_type('STARTED_AT') }} AS DAY_TYPE,
{{ season('STARTED_AT') }} AS STATION_OF_YEAR
from {{ source('demo','bike') }}
where Started_AT != 'started_at'
)

Select * from CTE