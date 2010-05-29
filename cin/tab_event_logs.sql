\qecho Creating table event_logs

select rlm.register_component ( 'CIN', 'tab_event_logs.sql' );

create table cin.event_logs
  ( id                              serial                 primary key
  , event_id                        int                    not null references events ( id )
  , message                         text
  , created_by                      varchar(30)            not null
  , created_date_time               timestamp              not null
  );

select rlm.component_registered ( 'tab_event_logs.sql' );
