\qecho Creating BIR trigger for party_group_types

select rlm.register_component ( 'CIN', 'trg_bir_party_group_types.sql' );

create trigger bir_party_group_types before insert on cin.party_group_types
  for each row execute procedure cin.bir_data_statuses();

select rlm.component_registered ( 'trg_bir_party_group_types.sql' );
