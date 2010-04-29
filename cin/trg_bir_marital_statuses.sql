\qecho Creating BIR trigger for marital_statuses

select rlm.register_component ( 'CIN', 'trg_bir_marital_statuses.sql' );

create trigger bir_marital_statuses before insert on cin.marital_statuses
  for each row execute procedure cin.bir_data_statuses();

select rlm.component_registered ( 'trg_bir_marital_statuses.sql' );
