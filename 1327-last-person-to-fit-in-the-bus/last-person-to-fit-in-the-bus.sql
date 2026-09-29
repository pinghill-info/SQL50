with total_weight as (
    select
    person_id,

     SUM(weight) OVER (
        ORDER BY turn
    ) AS running_total_weight
    from Queue
)

select Queue.person_name as person_name
from Queue join total_weight on Queue.person_id = total_weight.person_id
where total_weight.running_total_weight <= 1000
order by  total_weight.running_total_weight desc
limit 1;



