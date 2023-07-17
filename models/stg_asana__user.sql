
with base as (

    select * 
    from {{ ref('stg_asana__user_tmp') }}

),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_asana__user_tmp')),
                staging_columns=get_user_columns()
            )
        }}
        
    from base
),

final as (
    
    select 
        id as user_id,
        email,
        name as user_name,
        row_number() over (partition by id order by _fivetran_synced desc) = 1 as is_most_recent_record
    from fields
    where not coalesce(_fivetran_deleted, false)
)

select * 
from final
