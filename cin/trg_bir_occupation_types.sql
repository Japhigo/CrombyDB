\qecho Creating BIR trigger for occupation_types

select rlm.register_component ( 'CIN', 'trg_bir_occupation_types.sql' );

create trigger bir_occupation_types before insert on cin.occupation_types
  for each row execute procedure cin.bir_data_statuses();

select rlm.component_registered ( 'trg_bir_occupation_types.sql' );
