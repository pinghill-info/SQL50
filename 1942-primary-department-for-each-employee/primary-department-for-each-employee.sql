with only_one_department as (
    select employee_id,
    count(department_id) as num_department
    from Employee
    group by employee_id
),
only_one as (
    select employee_id
    from only_one_department
    where num_department = 1
)
select
employee_id,
department_id
from Employee
where primary_flag = 'Y' or employee_id IN (SELECT employee_id FROM only_one);
