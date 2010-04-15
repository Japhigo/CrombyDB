\qecho Creating BUR trigger for postal_address_categories

select rlm.register_component ( 'CIN', 'trg_bur_postal_address_categories.sql' );

create trigger bur_postal_address_categories before update on cin.postal_address_categories
  for each row execute procedure cin.bur_data_statuses();

select rlm.component_registered ( 'trg_bur_postal_address_categories.sql' );
