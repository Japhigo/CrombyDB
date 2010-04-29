\qecho Creating BIR trigger for genders

select rlm.register_component ( 'CIN', 'trg_bir_genders.sql' );

create trigger bir_genders before insert on cin.genders
  for each row execute procedure cin.bir_data_statuses();

select rlm.component_registered ( 'trg_bir_genders.sql' );
