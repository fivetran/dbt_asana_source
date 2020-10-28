with team as (

    select *
    from {{ var('team') }}

), fields as (

    select
        id as team_id,
        name as team_name

    from team
    where not coalesce(_fivetran_deleted, false)
)

select *
from fields