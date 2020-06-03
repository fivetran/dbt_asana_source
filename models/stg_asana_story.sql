with story as (

    select *
    from {{ var('story') }}

), fields as (

    select
      id as story_id,
      created_at,
      created_by_id as created_by_user_id,
      target_id as target_task_id,
      text as event_description, -- eh is this a good name? the text describes the action taken or is the content of the comment
      type as event_type

    from story
)

select *
from fields