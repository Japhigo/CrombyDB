\qecho Creating table events

select rlm.register_component('CIN', 'tab_events.sql');

create table cin.events
  (id                              serial                 primary key
  ,relationship_id                 int                    not null references cin.party_relationships(id)
  ,event_type_id                   int                    not null references cin.event_types(id)
  ,event_status_id                 int                    not null references cin.event_statuses(id)
  ,description                     varchar(255)           not null
  ,from_date_time                  timestamp              not null
  ,to_date_time                    timestamp
  ,notes                           text
  ,planned_start_date_time         timestamp
  ,created_by                      varchar(30)            not null
  ,created_at                      timestamp              not null
  ,updated_by                      varchar(30)            not null
  ,updated_at                      timestamp              not null
  ,data_status_code                smallint               not null
  );

select rlm.component_registered('tab_events.sql');
