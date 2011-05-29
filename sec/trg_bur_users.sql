\qecho Creating BUR trigger for users

select rlm.register_component('SEC', 'trg_bur_users.sql');

create trigger bur_users before update on sec.users
  for each row execute procedure sec.bur_users();

select rlm.component_registered('trg_bur_users.sql');
