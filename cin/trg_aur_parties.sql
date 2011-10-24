\qecho Creating AUR trigger for parties

select rlm.register_component('CIN', 'trg_aur_parties.sql');

create trigger bur_parties after update on cin.parties
  for each row execute procedure cin.aur_data_statuses();

select rlm.component_registered('CIN', 'trg_aur_parties.sql');
