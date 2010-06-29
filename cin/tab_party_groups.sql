\qecho Creating table party_groups

select rlm.register_component ( 'CIN', 'tab_party_groups.sql' );

create table cin.party_groups
  ( id                              serial                 primary key
  , party_id                        int                    not null references cin.parties ( id )
  ,	effective_date                  date
  ,	dissolved_date                  date
  , party_group_type_id             int                    not null references cin.party_group_types ( id )
  , member_count                    int                    not null default 0
  , created_by                      varchar(30)            not null
  , created_date_time               timestamp              not null
  , updated_by                      varchar(30)            not null
  , updated_date_time               timestamp              not null
  , data_status_code                smallint               not null
  , unique ( party_id )
  );

select rlm.component_registered ( 'tab_party_groups.sql' );
