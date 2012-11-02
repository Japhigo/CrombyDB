\qecho Creating BUR trigger for party_role_types

select rlm.register_component ('CIN', 'trg_bur_party_role_types.sql');

create trigger bur_party_role_types before update on cin.party_role_types
  for each row execute procedure cin.bur_data_statuses();

select rlm.component_registered ('CIN', 'trg_bur_party_role_types.sql');
