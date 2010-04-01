\qecho Creating table communication_languages

select rlm.register_component ( 'CIN', 'tab_communication_languages.sql' );

create table cin.communication_languages
  ( id                              serial                 primary key
  , code_a3b                        char(3)                not null
  , code_a3t                        char(3)
  , code_a2                         char(2)
  , english_name                    varchar(100)           not null
  , french_name                     varchar(100)           not null
  , used_flag                       char(1)                not null default 'N'
  , created_by                      varchar(30)            not null default session_user
  , created_date_time               timestamp              not null default current_timestamp
  , updated_by                      varchar(30)            not null default session_user
  , updated_date_time               timestamp              not null default current_timestamp
  , data_status_code                smallint               not null default 1
  , unique ( code_a3b )
  );

select rlm.component_registered ( 'tab_communication_languages.sql' );


