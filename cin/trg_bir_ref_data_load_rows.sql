\qecho Creating BIR trigger for ref_data_load_rows

select rlm.register_component ( 'CIN', 'trg_bir_ref_data_load_rows.sql' );

create trigger bir_ref_data_load_rows before insert on cin.ref_data_load_rows
  for each row execute procedure cin.bir_audit();

select rlm.component_registered ( 'trg_bir_ref_data_load_rows.sql' );
