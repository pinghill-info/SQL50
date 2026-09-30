with daily as(
    select sum(amount) as amount,
    visited_on
    from Customer
    group by visited_on
), 

windowed as(
select 
visited_on,
sum(amount) over(order by visited_on rows between 6 preceding and current row) as amount,
Row_number() over(order by visited_on) as rn
from daily
)

select
visited_on,
amount,
round(amount/7,2) as average_amount
from windowed
where rn >= 7
order by visited_on asc

