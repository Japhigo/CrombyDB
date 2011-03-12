\qecho Creating domain address_format_type

select rlm.register_component('CIN', 'dom_address_format_type.sql');

create domain cin.address_format_type as char(3)
  not null default 'FRF'
  constraint cname check(value in ('FRF', 'MAT'));

select rlm.component_registered('dom_address_format_type.sql');
