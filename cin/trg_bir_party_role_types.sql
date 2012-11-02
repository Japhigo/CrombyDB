\qecho Creating BIR trigger for party_role_types

select rlm.register_component ('CIN', 'trg_bir_party_role_types.sql');

create trigger bir_party_role_types before insert on cin.party_role_types
  for each row execute procedure cin.bir_data_statuses();

select rlm.component_registered ('CIN', 'trg_bir_party_role_types.sql');
