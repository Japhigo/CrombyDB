\qecho Creating indexes on users

select rlm.register_component('SEC', 'idx_users.sql');

create unique index users_user_uuid_idx on sec.users(user_uuid);

select rlm.component_registered('idx_users.sql');
