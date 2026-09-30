# Write your MySQL query statement below
SELECT sell_date, 
count(distinct product) as num_sold,
GROUP_CONCAT(distinct product order by product asc separator ',') AS products
FROM Activities
GROUP BY sell_date;