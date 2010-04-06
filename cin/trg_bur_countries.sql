\qecho Creating BUR trigger for countries

select rlm.register_component ( 'CIN', 'trg_bur_countries.sql' );

create trigger bur_countries before update on cin.countries
  for each row execute procedure cin.bur_data_statuses();

select rlm.component_registered ( 'trg_bur_countries.sql' );
