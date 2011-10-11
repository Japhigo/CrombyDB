\qecho Creating table db_releases

create table rlm.db_releases
  (id                 serial            primary key
  ,release_type_code  varchar3          not null check(release_type_code in ('INS', 'DAT', 'UPG', 'FIX'))
  ,major_id           smallint          not null
  ,minor_id           smallint          not null
  ,sub_id             smallint          not null
  ,description        varchar(255)      not null
  ,release_notes      text              not null
  ,installed_by       varchar(30)       not null
  ,start_date_time    timestamp         not null  default current_timestamp
  ,end_date_time      timestamp
  ,unique(release_type_code
         ,major_id
         ,minor_id
         ,sub_id
         )
  );

comment on table rlm.db_releases is '@DOCBOOK Cromby database release history.';
comment on column rlm.db_releases.id is '@DOCBOOK Unique identifier for row.';
comment on column rlm.db_releases.release_type_code is '@DOCBOOK Indicates if this a database install, a data release, a database upgrade, or a defect fix.';
comment on column rlm.db_releases.major_id is '@DOCBOOK Major release ID.';
comment on column rlm.db_releases.minor_id is '@DOCBOOK Minor release ID.';
comment on column rlm.db_releases.sub_id is '@DOCBOOK Sub release ID.';
comment on column rlm.db_releases.description is '@DOCBOOK Purpose of the release.';
comment on column rlm.db_releases.release_notes is '@DOCBOOK Brief notes on the contents of the release.';
comment on column rlm.db_releases.installed_by is '@DOCBOOK user who ran in the release.';
comment on column rlm.db_releases.start_date_time is '@DOCBOOK Timestamp of the start of the release installation.';
comment on column rlm.db_releases.end_date_time is '@DOCBOOK Timestamp of when the installation of the release finished.';

