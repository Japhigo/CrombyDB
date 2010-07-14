\qecho Creating BUR trigger for party_groups

select rlm.register_component ( 'CIN', 'trg_bur_party_groups.sql' );

create trigger bur_parties before update on cin.party_groups
  for each row execute procedure cin.bur_party_groups();

select rlm.component_registered ( 'trg_bur_party_groups.sql' );
