\qecho Creating table event_roles

select rlm.register_component ( 'CIN', 'tab_event_roles.sql' );

create table cin.event_roles
  ( id                              serial                 primary key
  , party_person_id               	int                    not null references cin.party_persons ( id )
  , event_id                        int                    not null references cin.events ( id )
  , event_role_type_id              int                    not null references cin.event_role_types ( id )
  , from_date_time                  timestamp              not null
  , to_date_time                    timestamp
  , created_by                      varchar(30)            not null
  , created_date_time               timestamp              not null
  , updated_by                      varchar(30)            not null
  , updated_date_time               timestamp              not null
  , data_status_code                smallint               not null
  );

select rlm.component_registered ( 'tab_event_roles.sql' );
