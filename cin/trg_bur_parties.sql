\qecho Creating BUR trigger for parties

select rlm.register_component('CIN', 'trg_bur_parties.sql');

create trigger bur_parties before update on cin.parties
  for each row execute procedure cin.bur_data_statuses();

comment on trigger bur_parties on cin.parties is '@DOCBOOK Before Update Row trigger to populate audit columns and set the data status code.';

select rlm.component_registered('CIN', 'trg_bur_parties.sql');
