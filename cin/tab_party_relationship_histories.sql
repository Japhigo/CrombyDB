\qecho Creating table party_relationship_histories

select rlm.register_component ( 'CIN', 'tab_party_relationship_histories.sql' );

create table cin.party_relationship_histories
  ( id                              serial                 primary key
  , party_relationship_id           int                    not null references cin.party_relationships (id )
  , from_party_role_id              int
  , to_party_role_id                int
  , description                     varchar(255)
  , relationship_priority_id        int
  , relationship_status_id          int
  , start_date                      date
  , end_date                        date
  , created_by                      varchar(30)
  , created_date_time               timestamp
  , updated_by                      varchar(30)
  , updated_date_time               timestamp
  , data_status_code                smallint
  );

select rlm.component_registered ( 'tab_party_relationship_histories.sql' );
