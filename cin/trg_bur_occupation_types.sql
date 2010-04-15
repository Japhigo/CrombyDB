\qecho Creating BUR trigger for occupation_types

select rlm.register_component ( 'CIN', 'trg_bur_occupation_types.sql' );

create trigger bur_occupation_types before update on cin.occupation_types
  for each row execute procedure cin.bur_data_statuses();

select rlm.component_registered ( 'trg_bur_occupation_types.sql' );
