with test as (
    select
    salary,
    dense_rank() over(order by salary desc) as ranking
    from Employee
)

select 
max(salary) as SecondHighestSalary
from test
where ranking = 2