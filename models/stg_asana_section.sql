with section as (

    select *
    from {{ var('section') }}

), fields as (

    select
        id as section_id,
        created_at,
        name as section_name,
        project_id

    from section

)

select *
from fields