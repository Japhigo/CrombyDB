\qecho Creating domain data_load_file_type

select rlm.register_component ( 'CIN', 'dom_data_load_file_type.sql' );

create domain cin.data_load_file_type as char(3)
  not null default 'CSV'
  constraint cname check ( value in ( 'CSV', 'TXT', 'XML', 'EDI' ) );

select rlm.component_registered ( 'dom_data_load_file_type.sql' );
