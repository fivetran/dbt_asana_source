with project as (

    select *
    from {{ var('project') }}

), fields as (

    select
      id as project_id,
      archived as is_archived,
      created_at,
      current_status, 
      due_date,
      modified_at,
      name as project_name,
      owner_id,
      public as is_public,
      team_id
      -- workspace_id -- not needed companies almost certainly just have 1 workspace

    from project
    where not _fivetran_deleted
)

select *
from fields