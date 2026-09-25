with first as (
    select U.name as name,
    count(*) as movies_rated
    from MovieRating MR inner join Users U on MR.user_id = U.user_id
    group by U.name
    order by movies_rated desc, name asc
    limit 1
),

topmovie as (
    select M.title as title,
    avg(rating) as avg_rating
    from MovieRating MR inner join Movies M on MR.movie_id = M.movie_id
    where created_at between '2020-02-01' and '2020-02-29'
    group by M.title
    order by avg_rating desc, title asc
    limit 1
)


select name as results 
from first 

union all 

select title from topmovie;

