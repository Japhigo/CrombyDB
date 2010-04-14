\echo   CCCCC    RRRRRRR        OOOOO    MMM   MMM   BBBBBBB    YYY   YYY
\echo  CCCCCCC   RRRRRRRR      OOOOOOO   MMMM MMMM   BBBBBBBB    YYY YYY
\echo CCCCCCCCC  RRRRRRRRR    OOOOOOOOO  MMMMMMMMM   BBB   BBB    VVYVV
\echo CCC        RRR   RRR    OOO   OOO  MMM M MMM   BBB   BB      YYY
\echo CCC        RRR   RRR    OOO   OOO  MMM   MMM   BBBBBBB       YYY
\echo CCC        RRRRRRRR     OOO   OOO  MMM   MMM   BBB   BB      YYY
\echo CCCCCCCCC  RRR   RRR    OOOOOOOOO  MMM   MMM   BBB   BBB     YYY
\echo  CCCCCCC   RRR    RRR    OOOOOOO   MMM   MMM   BBBBBBBB      YYY
\echo   CCCCC    RRR     RRR    OOOOO    MMM   MMM   BBBBBBB       YYY

\o cromby_install.log

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

--\cd ..
--\cd public
--\i public.sql

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
