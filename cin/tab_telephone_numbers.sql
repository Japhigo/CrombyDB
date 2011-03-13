\qecho Creating table telephone_numbers

select rlm.register_component('CIN', 'tab_telephone_numbers.sql');

create table cin.telephone_numbers
  (id                              serial                 primary key
  ,contact_point_id                int                    not null  references cin.contact_points(id)
  ,telephone_number                varchar(15)            not null
  ,extension                       varchar(15)
  ,telephone_connection_type_id    int                    not null references cin.telephone_connection_types(id)
  ,created_by                      varchar(30)            not null
  ,created_at                      timestamp              not null
  ,updated_by                      varchar(30)            not null
  ,updated_at                      timestamp              not null
  ,data_status_code                smallint               not null
  ,unique ( contact_point_id )
  );

select rlm.component_registered('tab_telephone_numbers.sql');
