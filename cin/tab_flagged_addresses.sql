\qecho Creating table flagged_addresses

select rlm.register_component ( 'CIN', 'tab_flagged_addresses.sql' );

create table cin.flagged_addresses
  ( id                              serial                 primary key
  , postal_address_id               int                    not null references cin.postal_addresses ( id )
  , flagged_address_reason_id       int                    not null references cin.flagged_address_reasons ( id )
  , notes                           text
  , created_by                      varchar(30)            not null
  , created_date_time               timestamp              not null
  , updated_by                      varchar(30)            not null
  , updated_date_time               timestamp              not null
  , data_status_code                smallint               not null
  , unique ( postal_address_id
	       , flagged_address_reason_id
           )
  );

select rlm.component_registered ( 'tab_flagged_addresses.sql' );
