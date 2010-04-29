\qecho Creating BIR trigger for postal_address_categories

select rlm.register_component ( 'CIN', 'trg_bir_postal_address_categories.sql' );

create trigger bir_postal_address_categories before insert on cin.postal_address_categories
  for each row execute procedure cin.bir_data_statuses();

select rlm.component_registered ( 'trg_bir_postal_address_categories.sql' );
