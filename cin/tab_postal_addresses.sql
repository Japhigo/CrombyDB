\qecho Creating table postal_addresses

select rlm.register_component ( 'CIN', 'tab_postal_addresses.sql' );

create table cin.postal_addresses
  ( id                              serial                 primary key
  , address_format_type_code        cin.address_format_type
  , address_category_id             int                    not null references cin.postal_address_categories ( id )
  , match_status_id                 int                    not null references cin.match_statuses ( id ) 
  , line_one                        varchar(35)
  , line_two                        varchar(35)
  , line_three                      varchar(35)
  , line_four                       varchar(35)
  , line_five                       varchar(35)
  , post_box_identifier             varchar(35)
  , building_unit_number            varchar(35)
  , building_number_name            varchar(35)
  , street                          varchar(35)
  , district                        varchar(35)
  , city                            varchar(35)
  , county                          varchar(35)
  , state                           varchar(35)
  , country_id                      int                    not null references cin.countries ( id )
  , post_code                       varchar(15)         
  , created_by                      varchar(30)            not null
  , created_date_time               timestamp              not null
  , updated_by                      varchar(30)            not null
  , updated_date_time               timestamp              not null
  , data_status_code                smallint               not null
  );

select rlm.component_registered ( 'tab_postal_addresses.sql' );
