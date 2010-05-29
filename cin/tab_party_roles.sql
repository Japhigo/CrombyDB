\qecho Creating table party_roles

select rlm.register_component ( 'CIN', 'tab_party_roles.sql' );

create table cin.party_roles
  ( id                              serial                 primary key
  , party_id                        int                    not null references cin.parties ( id )
  , party_role_type_id              int                    not null references cin.party_role_types ( id )
  , description                     varchar(255)           not null
  , start_date                      date                   not null
  , end_date                        date
  , created_by                      varchar(30)            not null
  , created_date_time               timestamp              not null
  , updated_by                      varchar(30)            not null
  , updated_date_time               timestamp              not null
  , data_status_code                smallint               not null
  , unique ( role_type
	       , party_object_type_code
           )
  );

select rlm.component_registered ( 'tab_party_role_types.sql' );
