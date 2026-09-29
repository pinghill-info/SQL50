with number_count as(
    select 
    num,
    count(num) as number_shows_up
    from MyNumbers
    group by num
)

select
max(num) as num
from number_count
where number_shows_up = 1