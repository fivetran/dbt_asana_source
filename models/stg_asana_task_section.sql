with task_section as (

    select *
    from {{ var('task_section') }}

), fields as (

    select
        section_id,
        task_id

    from task_section

)

select *
from fields