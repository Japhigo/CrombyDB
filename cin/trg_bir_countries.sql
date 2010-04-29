\qecho Creating BIR trigger for countries

select rlm.register_component ( 'CIN', 'trg_bir_countries.sql' );

create trigger bir_countries before insert on cin.countries
  for each row execute procedure cin.bir_data_statuses();

select rlm.component_registered ( 'trg_bir_countries.sql' );
