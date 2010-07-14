\qecho Creating BUR trigger for data_load_statuses

select rlm.register_component ( 'CIN', 'trg_bur_data_load_statuses.sql' );

create trigger bur_data_load_statuses before update on cin.data_load_statuses
  for each row execute procedure cin.bur_audit();

select rlm.component_registered ( 'trg_bur_data_load_statuses.sql' );
