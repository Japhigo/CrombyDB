\qecho Creating table security_controls

select rlm.register_component('SEC', 'tab_security_controls.sql');

create table sec.security_controls
  (days_until_password_expiry      int                    not null
  ,min_password_length             int                    not null
  ,max_password_length             int                    not null
  ,password_history_count          int                    not null
  ,updated_by                      varchar(30)            not null
  ,updated_at                      timestamp              not null
  );

select rlm.component_registered('tab_security_controls.sql');
