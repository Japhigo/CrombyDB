\qecho Creating table login_histories

select rlm.register_component('SEC', 'tab_login_histories.sql');

create table sec.user_login_histories
  (id                              serial                 primary key
  ,user_name                       varchar(255)           not null check(length(user_name) > 0)
  ,login_successful                boolean                not null
  ,user_known                      boolean                not null
  ,session_user_name               name
  ,current_user_name               name
  ,client_address                  text
  ,created_by                      varchar(30)            not null
  ,created_at                      timestamp              not null
  ,updated_by                      varchar(30)            not null
  ,updated_at                      timestamp              not null
  );

select rlm.component_registered('SEC', 'tab_login_histories.sql');
