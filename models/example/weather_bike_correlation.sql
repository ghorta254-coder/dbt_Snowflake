with CTE AS (

    Select* 
    from {{ref('trip_fact')}} t
    left join {{ref('daily_weather')}} w
    ON t.TRIP_DATE = w.daily_weather

    ORDER by TRIP_DATE
)
Select * from CTE