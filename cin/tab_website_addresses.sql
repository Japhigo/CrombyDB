\qecho Creating table website_addresses

select rlm.register_component ( 'CIN', 'tab_website_addresses.sql' );

create table cin.website_addresses
  (	id                              serial                 primary key
  , contact_point_id                int                    not null  references cin.contact_points ( id )
  , website_url                     varchar(255)           not null
  , created_by                      varchar(30)            not null
  , created_date_time               timestamp              not null
  , updated_by                      varchar(30)            not null
  , updated_date_time               timestamp              not null
  , data_status_code                smallint               not null
  , unique ( contact_point_id )
  );

select rlm.component_registered ( 'tab_website_addresses.sql' );
