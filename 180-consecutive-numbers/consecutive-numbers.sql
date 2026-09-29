select distinct w1.num as ConsecutiveNums
from Logs w1 join Logs w2 on w2.id = w1.id + 1 
join Logs w3 on w3.id = w1.id + 2
where w1.num = w2.num and w2.num = w3.num;