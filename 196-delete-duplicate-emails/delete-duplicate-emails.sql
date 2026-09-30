with test as (
    select id,
    email,
    count(*) over (partition by email order by id) as email_count
    from Person
)

delete from Person
where id in (select id from test where email_count > 1)



