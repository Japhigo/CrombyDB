\qecho Creating BUR trigger for party_group_types

select rlm.register_component ( 'CIN', 'trg_bur_party_group_types.sql' );

create trigger bur_party_group_types before update on cin.party_group_types
  for each row execute procedure cin.bur_data_statuses();

select rlm.component_registered ( 'trg_bur_party_group_types.sql' );
