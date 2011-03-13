\o cromby_exdata_0_0_1.log

select current_timestamp;

\qecho Inserting example data...

\qecho Creating temporary table to hold release details

create table tmp_release_details
  ( release_type_code  char(3)       not null
  , major_id           smallint      not null
  , minor_id           smallint      not null
  , sub_id             smallint      not null
  , description        varchar(255)  not null
  , release_notes      varchar(255)
  );

\qecho Setting up release details

insert into tmp_release_details
  ( release_type_code
  , major_id
  , minor_id
  , sub_id
  , description
  , release_notes
  )
values
  ( 'DAT'
  , 0
  , 0
  , 1
  , 'initial build'
  , 'Example data'
  );

\echo Registering the release

select rlm.register_release();

\qecho Inserting data...

\i cin_data.sql

\qecho Example data inserted

\qecho Cleaning up

drop table if exists tmp_release_details;
	
select rlm.mark_release_complete();

\qecho displaying installed components

select * from viw_db_releases;

select * from viw_db_release_components order by start_date_time;

\qecho Install finished

