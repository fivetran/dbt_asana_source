with asana_user as (

    select *
    from {{ var('user') }}

), fields as (

    select
      id as user_id,
      email,
      name as user_name
    from asana_user
    where not _fivetran_deleted
)

select *
from fields