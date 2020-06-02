with task_tag as (

    select *
    from {{ var('task_tag') }}

), fields as (

    select
        tag_id,
        task_id

    from task_tag

)

select *
from fields