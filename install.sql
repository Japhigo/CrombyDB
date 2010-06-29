\pset tuples_only
\o cromby_install.log

select current_timestamp;

\qecho Installing...

--
-- Stop users from creating objects in the public schema
--
revoke create on schema public from public;

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
  , release_notes
  )
values
  ( 0
  , 0
  , 1
  , 'initial build'
  , 'Database install'
  );

\qecho Installing components...

\cd rlm
\i rlm.sql

\cd ..
\cd cin
\i cin.sql

\cd ..
\cd sec
\i sec.sql

\cd ..
\cd public
\i public.sql

\cd ..
\qecho Components installed

--\i permissions.sql

\qecho Cleaning up

drop table if exists tmp_release_details;
	
select rlm.mark_release_complete();

\qecho displaying installed components

select * from view_db_releases;

select * from view_db_release_components order by start_date_time;

\qecho Install finished
