\qecho Creating table contact_points

select rlm.register_component('CIN', 'tab_contact_points.sql');

create table cin.contact_points
  (id                              serial                 primary key
  ,contact_point_set_id            int                    not null references cin.contact_point_sets(id)
  ,contact_point_object_type_code  cin.contact_point_object_type
  ,contact_point_usage_type_id     int                    not null references cin.contact_point_usage_types(id)
  ,contact_point_fail_type_id      int                             references cin.contact_point_fail_types(id)
  ,effective_from_date             date                   not null
  ,effective_to_date               date
  ,created_by                      varchar(30)            not null
  ,created_at                      timestamp              not null
  ,updated_by                      varchar(30)            not null
  ,updated_at                      timestamp              not null
  ,data_status_codes               smallint               not null
  );

select rlm.component_registered ( 'tab_contact_points.sql' );
