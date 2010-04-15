\qecho Creating BUR trigger for party_types

select rlm.register_component ( 'CIN', 'trg_bur_party_types.sql' );

create trigger bur_party_types before update on cin.party_types
  for each row execute procedure cin.bur_data_statuses();

select rlm.component_registered ( 'trg_bur_party_types.sql' );
