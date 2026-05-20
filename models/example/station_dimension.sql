WITH BIKE as (

Select 
distinct 
START_STATIO_ID AS STATION_ID,
start_station_name as station_name,
start_lat as station_lat,
start_lng as start_station_lng

from {{source('demo','bike')}}

where RIDE_ID != 'ride_id'



)
Select * from BIKE