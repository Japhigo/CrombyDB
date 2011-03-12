\qecho Creating domain party_object_type

select rlm.register_component('CIN', 'dom_party_object_type.sql');

create domain cin.party_object_type as char(3)
  not null default 'PER'
  constraint cname check(value in ('GRP', 'PER', 'ORG'));

select rlm.component_registered('dom_party_object_type.sql');
