\qecho Creating view db_releases

select rlm.register_component('PUB', 'viw_db_releases.sql');

create or replace view public.vw_db_releases
as
  select id
        ,release_type_code
        ,case when release_type_code = 'INS' then 'Install'
              when release_type_code = 'UPG' then 'Upgrade'
              when release_type_code = 'DAT' then 'Data'
              when release_type_code = 'FIX' then 'Patch'
         end as release_type
        ,ltrim(to_char(major_id, '999')) || '.' || 
         ltrim(to_char(minor_id, '999')) || '.' ||
         ltrim(to_char(sub_id, '999')) as db_release
        ,description
        ,release_notes
        ,installed_by
        ,start_date_time
        ,end_date_time
    from rlm.db_releases;

select rlm.component_registered('viw_db_releases.sql');

