with test as (
    select
    pid,
    tiv_2016,
    Count(*) over (partition by tiv_2015) as tiv_count,
    Count(*) over (partition by lat, lon) as city_count
    from Insurance
)

select 
round(sum(tiv_2016), 2) as tiv_2016
from test
where tiv_count > 1 and city_count = 1;