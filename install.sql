\o cromby_install.log

select current_timestamp;

\qecho Installing...

\qecho Creating temporary table to hold release details

create table tmp_release_details
  (release_type_code  char(3)       not null
  ,major_id           smallint      not null
  ,minor_id           smallint      not null
  ,sub_id             smallint      not null
  ,description        varchar(255)  not null
  ,release_notes      varchar(255)
  );

\qecho Setting up release details

insert into tmp_release_details
  (release_type_code
  ,major_id
  ,minor_id
  ,sub_id
  ,description
  ,release_notes
  )
values
  ('INS'
  ,0
  ,0
  ,1
  ,'initial build'
  ,'Database install'
  );

\qecho Installing components...

--\cd rlm
--\i rlm.sql

--\cd ..
--\cd wkf
--\i wkf.sql

--\cd ..
--\cd cin
--\i cin.sql

--\cd ..
--\cd sec
--\i sec.sql

--\cd ..
--\cd public
--\i public.sql

\cd ..
\qecho Components installed

\qecho Cleaning up

--drop table if exists tmp_release_details;
	
--select rlm.mark_release_complete();

\qecho displaying installed components

--select * from vw_db_releases where id = (select max(id) from vw_db_releases);

--select * from vw_db_release_components where db_release_id = (select max(id) from vw_db_releases) order by start_date_time;

\qecho Install finished

select current_timestamp;
