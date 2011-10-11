\qecho Creating BIR trigger for users

select rlm.register_component('SEC', 'trg_bir_users.sql');

create trigger bir_users before insert on sec.users
  for each row execute procedure sec.bir_users();

comment on trigger bir_user_roles on sec.user_roles is '@DOCBOOK Before Insert Row to check audit columns and set default values';

select rlm.component_registered('SEC', 'trg_bir_users.sql');
