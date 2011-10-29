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

comment on table public.sessions is '@DOCBOOK Rails session data.';
comment on column public.sessions.id is '@DOCBOOK Unique identifier for row.';
comment on column public.sessions.session_id is '@DOCBOOK Rails session ID.';
comment on column public.sessions.data is '@DOCBOOK Rails session data.';
comment on column public.sessions.created_at is '@DOCBOOK Date and time the record was created.';
comment on column public.sessions.updated_at is '@DOCBOOK Date and time the record was last updated.';

select rlm.component_registered('PUB', 'tab_sessions.sql');

