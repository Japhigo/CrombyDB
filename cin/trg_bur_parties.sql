\qecho Creating BUR trigger for parties

select rlm.register_component ( 'CIN', 'trg_bur_parties.sql' );

create trigger bur_parties before update on cin.parties
  for each row execute procedure cin.bur_parties();

select rlm.component_registered ( 'trg_bur_parties.sql' );
