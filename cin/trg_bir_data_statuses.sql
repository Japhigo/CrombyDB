\qecho Creating BIR trigger for data_statuses

select rlm.register_component ('CIN', 'trg_bir_data_statuses.sql');

create trigger bir_data_statuses before insert on cin.data_statuses
  for each row execute procedure cin.bir_audit();

comment on trigger bir_data_statuses on cin.data_statuses is '@DOCBOOK Before Insert Row trigger to populate audit columns.';

select rlm.component_registered ('CIN', 'trg_bir_data_statuses.sql');
