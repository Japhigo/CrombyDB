\qecho Creating BUR trigger for employment_statuses

select rlm.register_component ( 'CIN', 'trg_bur_employment_statuses.sql' );

create trigger bur_employment_statuses before update on cin.employment_statuses
  for each row execute procedure cin.bur_data_statuses();

select rlm.component_registered ( 'trg_bur_employment_statuses.sql' );
