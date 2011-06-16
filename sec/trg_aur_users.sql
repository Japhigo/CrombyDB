\qecho Creating AUR trigger for users

select rlm.register_component('SEC', 'trg_aur_users.sql');

create trigger aur_users after update on sec.users
  for each row execute procedure sec.aur_users();

select rlm.component_registered('trg_aur_users.sql');
