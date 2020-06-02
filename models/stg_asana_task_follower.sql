with task_follower as (

    select *
    from {{ var('task_follower') }}

), fields as (

    select
        task_id,
        user_id

    from task_follower

)

select *
from fields