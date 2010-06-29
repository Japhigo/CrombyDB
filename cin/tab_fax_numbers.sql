\qecho Creating table fax_numbers

select rlm.register_component ( 'CIN', 'tab_fax_numbers.sql' );

create table cin.fax_numbers
  (	id                              serial                 primary key
  , contact_point_id                int                    not null  references cin.contact_points ( id )
  , fax_number                      varchar(15)            not null
  , created_by                      varchar(30)            not null
  , created_date_time               timestamp              not null
  , updated_by                      varchar(30)            not null
  , updated_date_time               timestamp              not null
  , data_status_code                smallint               not null
  , unique ( contact_point_id )
  );

select rlm.component_registered ( 'tab_fax_numbers.sql' );
