\qecho Creating table contact_point_sets

select rlm.register_component ( 'CIN', 'tab_contact_point_sets.sql' );

create table cin.contact_point_sets
  ( id                              serial                 primary key
  , party_id                        int                    not null references cin.party_id ( id )
  , created_by                      varchar(30)            not null
  , created_date_time               timestamp              not null
  , updated_by                      varchar(30)            not null
  , updated_date_time               timestamp              not null
  , data_status_code                smallint               not null
  , unique ( party_id )
  );

select rlm.component_registered ( 'tab_contact_point_sets.sql' );
