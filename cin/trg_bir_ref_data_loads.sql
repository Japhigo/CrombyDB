\qecho Creating BIR trigger for ref_data_loads

select rlm.register_component ( 'CIN', 'trg_bir_ref_data_loads.sql' );

create trigger bir_ref_data_loads before insert on cin.ref_data_loads
  for each row execute procedure cin.bir_audit();

select rlm.component_registered ( 'trg_bir_ref_data_loads.sql' );
