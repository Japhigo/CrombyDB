\qecho Creating BIR trigger for data_statuses

select rlm.register_component ( 'CIN', 'trg_bir_data_statuses.sql' );

create trigger bir_data_statuses before insert on cin.data_statuses
  for each row execute procedure cin.bir_audit();

select rlm.component_registered ( 'trg_bir_data_statuses.sql' );
