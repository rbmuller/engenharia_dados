{{ config(materialized='table') }}

with source as (
    SELECT 
        TO_TIMESTAMP(due_date, 'YYYY-MM-DD HH24:MI:SS') due_date,  
        TO_TIMESTAMP(due_time, 'YYYY-MM-DD HH24:MI:SS') due_time,
        duration,
        deal_id,
        person_id,
        org_id,
        note,
        'location',
        public_description,
        id,
        done,
        'subject',
        'type',
        'user_id',
        participants,
        busy_flag,
        attendees,
        company_id,
        reference_type,
        reference_id,
        conference_meeting_client,
        conference_meeting_url,
        conference_meeting_id,
        TO_TIMESTAMP(add_time, 'YYYY-MM-DD HH24:MI:SS') add_time,
        TO_TIMESTAMP(marked_as_done_time, 'YYYY-MM-DD HH24:MI:SS') marked_as_done_time,
        TO_TIMESTAMP(last_notification_time, 'YYYY-MM-DD HH24:MI:SS') last_notification_time,
        TO_TIMESTAMP(last_notification_user_id, 'YYYY-MM-DD HH24:MI:SS') last_notification_user_id,
        notification_language_id,
        lead_id,
        active_flag,
        TO_TIMESTAMP(update_time, 'YYYY-MM-DD HH24:MI:SS') update_time,
        update_user_id,
        gcal_event_id,
        google_calendar_id,
        google_calendar_etag,
        calendar_sync_include_context,
        TO_TIMESTAMP(source_timezone, 'YYYY-MM-DD HH24:MI:SS') source_timezone,
        rec_rule,
        rec_rule_extension,
        rec_master_activity_id,
        series,
        created_by_user_id,
        location_subpremise,
        location_street_number,
        location_route,
        location_sublocality,
        location_locality,
        location_admin_area_level_1,
        location_admin_area_level_2,
        location_country,
        location_postal_code,
        location_formatted_address,
        location_lat,
        location_long,
        org_name,
        person_name,      
        deal_title,
        owner_name,
        person_dropbox_bcc,
        deal_dropbox_bcc,
        assigned_to_user_id,
        'file'
    FROM {{ source('pipedrive', 'pipedrive_activity ') }}
)
select *
from source