with total as (
    select requester_id as id from RequestAccepted
    Union All
    select accepter_id as id from RequestAccepted
)
select 
id,
count(*) as num
from total
group by id
order by num desc
limit 1;
