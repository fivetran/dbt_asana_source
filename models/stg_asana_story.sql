with story as (

    select *
    from {{ var('story') }}

), fields as (

    select
      id as story_id,
      created_at,
      created_by_id as created_by_user_id,
      target_id as target_task_id,
      text as story_content, -- I like "content" for this. I feels like a term that can be used both for the system generated logs, as well as user text
      type as event_type

    from story
)

select *
from fields