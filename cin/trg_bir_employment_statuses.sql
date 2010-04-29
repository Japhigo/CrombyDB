\qecho Creating BIR trigger for employment_statuses

select rlm.register_component ( 'CIN', 'trg_bir_employment_statuses.sql' );

create trigger bir_employment_statuses before insert on cin.employment_statuses
  for each row execute procedure cin.bir_data_statuses();

select rlm.component_registered ( 'trg_bir_employment_statuses.sql' );
