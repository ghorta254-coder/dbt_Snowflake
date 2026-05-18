WITH CTE AS (
Select to_timestamp(Started_AT),
DATE(to_timestamp(Started_AT)) AS DATE_STARTED_AT,
HOUR(to_timestamp(Started_AT)) AS HOUR_STARTED_AT, 
CASE 
WHEN DAYNAME(to_timestamp(Started_AT)) in ('Sat','Sun')
THEN 'WEEKEND'
ELSE 'BUSINESSDAY'
END AS DAY_TYPE,
CASE 
WHEN MONTH(to_timestamp(Started_AT)) in (12,1,2) 
THEN 'WINTER'
WHEN MONTH(to_timestamp(Started_AT)) in (3,4,5) 
THEN 'SPRING'
WHEN MONTH(to_timestamp(Started_AT)) in (6,7,8) 
THEN 'SUMMER'
ELSE  'AUTUMN'
END as STATION_OF_YEAR
from {{source('demo','bike')}}
where Started_AT != 'started_at')
Select * from CTE