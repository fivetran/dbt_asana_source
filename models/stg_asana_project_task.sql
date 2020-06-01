with project_task as (

    select *
    from {{ var('project_task') }}

), fields as (

    select
        project_id,
        task_id

    from project_task

)

select *
from fields