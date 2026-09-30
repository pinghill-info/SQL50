select P.product_name as product_name,
sum(O.unit) as unit
from Orders O join Products P on O.product_id = P.product_id
where O.order_date between '2020-02-01' and '2020-02-29'
group by P.product_id, P.product_name
having sum(O.unit) >= 100
