\qecho Creating view db_releases

select rlm.register_component ( 'PUB', 'viw_db_releases.sql' );

create or replace view public.view_db_releases
as
  select id
   	    ,ltrim ( to_char ( major_id, '999' ) ) || '.' || 
           ltrim ( to_char ( minor_id, '999' ) ) || '.' ||
           ltrim ( to_char ( sub_id, '999' ) ) as db_release
        ,description
        ,release_notes_url
        ,installed_by
        ,start_date_time
        ,end_date_time
    from rlm.db_releases;

select rlm.component_registered ( 'viw_db_releases.sql' );
