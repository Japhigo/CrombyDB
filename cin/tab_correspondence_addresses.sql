\qecho Creating table correspondence_addresses

select rlm.register_component('CIN', 'tab_correspondence_addresses.sql');

create table cin.correspondence_addresses
  (id                              serial                 primary key
  ,contact_point_id                int                    not null  references cin.contact_points(id)
  ,postal_address_id               int                    not null  references cin.postal_addresses(id)
  ,attention_of_text               varchar(35)
  ,created_by                      varchar(30)            not null
  ,created_at                      timestamp              not null
  ,updated_by                      varchar(30)            not null
  ,updated_at                      timestamp              not null
  ,data_status_code                smallint               not null
  ,unique(contact_point_id)
  );

select rlm.component_registered('tab_correspondence_addresses.sql');
