\qecho Creating table user_login_histories

select rlm.register_component('SEC', 'tab_user_login_histories.sql');

create table sec.user_login_histories
  (id                              serial                 primary key
  ,user_id                         int                    not null references sec.users(id)
  ,login_successful                boolean                not null
  ,session_user_name               name
  ,current_user_name               name
  ,client_address                  text
  ,created_by                      varchar(30)            not null
  ,created_at                      timestamp              not null
  );

select rlm.component_registered('tab_user_login_histories.sql');
