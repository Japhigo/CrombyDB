\qecho Creating AUR trigger for users

select rlm.register_component('SEC', 'trg_aur_users.sql');

create trigger aur_users after update on sec.users
  for each row execute procedure sec.aur_users();

comment on trigger aur_users on sec.users is '@DOCBOOK After Update Row to populate <link linkend="sec-table-user_password_histories">USER_PASSWORD_HISTORIES.</link>.';

select rlm.component_registered('SEC', 'trg_aur_users.sql');
