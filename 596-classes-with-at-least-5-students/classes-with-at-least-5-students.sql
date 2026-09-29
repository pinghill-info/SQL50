with number as (
    select 
    class,
    count(distinct student) as number_students
    from Courses
    group by class
)

select
class
from number 
where number.number_students >= 5