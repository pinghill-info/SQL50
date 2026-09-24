with first_game as (
    select
    player_id,
    min(event_date) as first_date
    from Activity
    group by player_id
)

select
round(count(Activity.player_id)/ (select count(*) from first_game) , 2) as fraction
from first_game join Activity on first_game.player_id = Activity.player_id  and first_game.first_date + interval 1 day = Activity.event_date 