with datemax as (
    select
    product_id,
    max(change_date) as new_date
    from Products
    WHERE change_date <= '2019-08-16'
    group by product_id
)

select
distinct Products.product_id,
    case
        when new_date > '2019-08-16' then 10
        when new_date = change_date then new_price
        else new_price
    end as price
    from datemax join Products on datemax.product_id = Products.product_id and datemax.new_date = Products.change_date

union

select
product_id,
    10 as price
    from Products
    group by product_id
    having min(change_date) > '2019-08-16';