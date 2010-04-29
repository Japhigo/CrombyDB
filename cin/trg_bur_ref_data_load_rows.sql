\qecho Creating BUR trigger for ref_data_load_rows

select rlm.register_component ( 'CIN', 'trg_bur_ref_data_load_rows.sql' );

create trigger bur_ref_data_load_rows before update on cin.ref_data_load_rows
  for each row execute procedure cin.bur_audit();

select rlm.component_registered ( 'trg_bur_ref_data_load_rows.sql' );
