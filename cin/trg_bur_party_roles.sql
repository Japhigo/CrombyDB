\qecho Creating BUR trigger for party_roles

select rlm.register_component ( 'CIN', 'trg_bur_party_roles.sql' );

create trigger bur_party_roles before update on cin.party_roles
  for each row execute procedure cin.bur_party_roles();

select rlm.component_registered ( 'trg_bur_party_roles.sql' );
