\qecho Creating BUR trigger for ref_data_loads

select rlm.register_component ( 'CIN', 'trg_bur_ref_data_loads.sql' );

create trigger bur_ref_data_loads before update on cin.ref_data_loads
  for each row execute procedure cin.bur_audit();

select rlm.component_registered ( 'trg_bur_ref_data_loads.sql' );
