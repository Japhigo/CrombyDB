\qecho Creating domain contact_point_object_type

select rlm.register_component ('CIN','dom_contact_point_object_type.sql');

create domain cin.contact_point_object_type as char(3)
  not null default 'ADR'
  constraint cname check(value in ('ADR', 'EML', 'FAX', 'TEL', 'WEB'));

select rlm.component_registered('dom_contact_point_object_type.sql');
