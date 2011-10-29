\qecho Creating BIR trigger for parties

select rlm.register_component('CIN', 'trg_bir_parties.sql');

create trigger bir_parties before insert on cin.parties
  for each row execute procedure cin.bir_data_statuses();

comment on trigger bir_parties on cin.parties is '@DOCBOOK Before Insert Row trigger to populate audit and data status columns.';

select rlm.component_registered('CIN', 'trg_bir_parties.sql');
