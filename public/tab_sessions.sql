\qecho Creating table sessions

--
-- The format of this table is determined by Rails
-- We are creating it here to avoid doing a migration
--

select rlm.register_component('PUB', 'tab_sessions.sql');

create table public.sessions
  (id                              serial                 primary key
  ,session_id                      varchar(255)           not null
  ,data                            text
  ,created_at                      timestamp
  ,updated_at                      timestamp
  );

select rlm.component_registered('tab_sessions.sql');

