\qecho Creating table user_password_histories

select rlm.register_component('SEC', 'tab_user_password_histories.sql');

create table sec.user_password_histories
  (id                              serial                 primary key
  ,user_id                         int                    not null references sec.users(id)
  ,hashed_password                 text                   not null
  ,created_by                      varchar(30)            not null
  ,created_at                      timestamp              not null
  );

select rlm.component_registered('tab_user_password_histories.sql');
