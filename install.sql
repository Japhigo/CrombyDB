\o cinpams_install.log

select current_timestamp;

\qecho Installing...

\qecho Creating temporary table to hold release details

create table tmp_release_details
  ( major_id           smallint      not null
  , minor_id           smallint      not null
  , sub_id             smallint      not null
  , description        varchar(255)  not null
  , release_notes_url  varchar(255)
  );

\qecho Setting up release details

insert into tmp_release_details
  ( major_id
  , minor_id
  , sub_id
  , description
  , release_notes_url
  )
values
  ( 0
  , 0
  , 1
  , 'initial build'
  , 'idoru.local'
  );


\qecho Installing components...

\cd rlm
\i rlm.sql

\cd ..
\cd cin
\i cin.sql

\cd ..
\cd public
\i public.sql

\cd ..
\qecho Components installed

\i permissions.sql

\qecho Cleaning up

drop table if exists tmp_release_details;
	
select rlm.mark_release_complete();

\qecho displaying installed components

select * from rlm.db_releases_v;

select * from rlm.db_release_components_v order by start_date_time;

\qecho Install finished
