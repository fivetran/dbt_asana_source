with tag as (

    select *
    from {{ var('tag') }}

), fields as (

    select
        id as tag_id,
        name as tag_name,
        created_at

    from tag
    where not _fivetran_deleted
)

select *
from fields