\qecho Creating BUR trigger for genders

select rlm.register_component ( 'CIN', 'trg_bur_genders.sql' );

create trigger bur_genders before update on cin.genders
  for each row execute procedure cin.bur_data_statuses();

select rlm.component_registered ( 'trg_bur_genders.sql' );
