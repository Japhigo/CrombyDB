\qecho Creating table non_user_logins

select rlm.register_component('SEC', 'tab_non_user_logins.sql');

create table sec.non_user_logins
  (id                              serial                 primary key
  ,user_name                       varchar(30)            not null
  ,session_user_name               name
  ,current_user_name               name
  ,client_address                  inet
  ,created_at                      timestamp              not null
  );

select rlm.component_registered('tab_non_user_logins.sql');
