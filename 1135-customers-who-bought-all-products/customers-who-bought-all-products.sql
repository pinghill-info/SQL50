with customer_product_count as (
    select customer_id,
    count(distinct product_key) as products_bought
    from Customer
    group by customer_id
)

select
customer_id
from customer_product_count
where products_bought = (select count(product_key) from Product);
