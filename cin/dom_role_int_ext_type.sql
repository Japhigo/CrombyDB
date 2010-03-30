\qecho Creating domain role_int_ext_type

select rlm.register_component ( 'CIN', 'dom_role_int_ext_type.sql' );

create domain cin.role_int_ext_type as char(3)
  not null default 'EXT'
  constraint cname check ( value in ( 'INT', 'EXT' ) );

select rlm.component_registered ( 'dom_role_int_ext_type.sql' );
