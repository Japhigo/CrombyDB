\qecho Creating table db_release_components

create table rlm.db_release_components
  (id                   serial              primary key
  ,db_release_id        int                 not null     references rlm.db_releases(id)
  ,component_type_code  varchar(3)                       check(component_type_code in ('ADM', 'BAT', 'CIN', 'PAM', 'PUB', 'RLM', 'SEC', 'WKF'))    
  ,component_name       varchar(255)        not null     check(length(component_name) > 0)
  ,installed_by         varchar(30)         not null     check(length(installed_by) > 0)
  ,start_date_time      timestamp           not null     default current_timestamp
  ,end_date_time        timestamp
  );

comment on table rlm.db_release_components is '@DOCBOOK Cromby database components installed for a release.';
comment on column rlm.db_release_components.id is '@DOCBOOK Unique identifier for row.';
comment on column rlm.db_release_components.db_release_id is '@DOCBOOK Foreign key to <link linkend="rlm-table-db_releases">DB_RELEASES.</link>';
comment on column rlm.db_release_components.component_type_code is '@DOCBOOK Indicates if the area the component is installed in.';
comment on column rlm.db_release_components.component_name is '@DOCBOOK name of the SQL script.';
comment on column rlm.db_release_components.installed_by is '@DOCBOOK user who ran in the release.';
comment on column rlm.db_release_components.start_date_time is '@DOCBOOK Timestamp of the start of the component installation.';
comment on column rlm.db_release_components.end_date_time is '@DOCBOOK Timestamp of when the installation of the component finished.';

