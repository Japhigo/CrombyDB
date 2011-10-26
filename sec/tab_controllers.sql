\qecho Creating table controllers

select rlm.register_component('SEC', 'tab_controllers.sql');

create table sec.controllers
  (id                              serial                 primary key
  ,controller                      varchar(255)           not null check(length(controller) > 0)
  ,description                     varchar(255)           not null check(length(description) > 0)
  ,created_by                      varchar(30)            not null
  ,created_at                      timestamp              not null
  ,updated_by                      varchar(30)            not null
  ,updated_at                      timestamp              not null
  );

comment on table sec.controllers is '@DOCBOOK Rails controllers for authorisation.';
comment on column sec.controllers.id is '@DOCBOOK Unique identifier for row.';
comment on column sec.controllers.controller is '@DOCBOOK Rails controller name.';
comment on column sec.controllers.description is '@DOCBOOK The purpose of the Rails controller.';
comment on column sec.controllers.created_by is '@DOCBOOK Username of the user who created the record.';
comment on column sec.controllers.created_at is '@DOCBOOK Date and time the record was created.';
comment on column sec.controllers.updated_by is '@DOCBOOK Username of user who last updated the record.';
comment on column sec.controllers.updated_at is '@DOCBOOK Date and time the record was last updated.';

select rlm.component_registered('SEC', 'tab_controllers.sql');
