\qecho Creating indexes on Users

select rlm.register_component ('SEC', 'idx_users.sql');

create unique index users_user_name_idx on sec.users(lower(user_name));

comment on index sec.users_user_name_idx is '@DOCBOOK Index to enforce uniqueness of USERS.USER_NAME.';

select rlm.component_registered('SEC', 'idx_users.sql');
