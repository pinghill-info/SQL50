with follow_count as (
    select
    user_id,
    count(follower_id) as followers_count
    from Followers
    group by user_id
)

select
user_id,
followers_count
from follow_count
order by user_id asc

