\qecho Creating BUR trigger for marital_statuses

select rlm.register_component ( 'CIN', 'trg_bur_marital_statuses.sql' );

create trigger bur_marital_statuses before update on cin.marital_statuses
  for each row execute procedure cin.bur_data_statuses();

select rlm.component_registered ( 'trg_bur_marital_statuses.sql' );
