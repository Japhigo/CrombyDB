\qecho Creating table email_addresses

select rlm.register_component ( 'CIN', 'tab_email_addresses.sql' );

create table cin.email_addresses
  (	id                              serial                 primary key
  , contact_point_id                int                    not null references cin.contact_points ( id )
  , email_address                   varchar(320)           not null
  , created_by                      varchar(30)            not null
  , created_date_time               timestamp              not null
  , updated_by                      varchar(30)            not null
  , updated_date_time               timestamp              not null
  , status                          smallint               not null
  , unique ( contact_point_id )
  );

select rlm.component_registered ( 'tab_email_addresses.sql' );
