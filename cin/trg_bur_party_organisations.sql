\qecho Creating BUR trigger for party organisations

select rlm.register_component ( 'CIN', 'trg_bur_party_organisations.sql' );

create trigger bur_party_organisations before update on cin.party_organisations
  for each row execute procedure cin.bur_party_organisations();

select rlm.component_registered ( 'trg_bur_party_organisations.sql' );
