\qecho Creating table menu_items

select rlm.register_component('SEC', 'tab_menu_items.sql');

create table sec.menu_items
  (id                              serial                 primary key
  ,menu_id                         int                    not null --references sec.menus(id)
  ,controller_id                   int                    not null --references sec.controllers(id)
  ,created_by                      varchar(30)            not null
  ,created_at                      timestamp              not null
  ,updated_by                      varchar(30)            not null
  ,updated_at                      timestamp              not null
  ,unique(menu_id
         ,controller_id)
  );

comment on table sec.menu_items is '@DOCBOOK Menu items; a controller on a menu.';
comment on column sec.menu_items.id is '@DOCBOOK Unique identifier for row.';
comment on column sec.menu_items.menu_id is '@DOCBOOK Foreign key to <link linkend="sec-table-menus">MENUS.</link>';
comment on column sec.menu_items.controller_id is '@DOCBOOK Foreign key to <link linkend="sec-table-controllers">CONTROLLERS.</link>';
comment on column sec.menu_items.created_by is '@DOCBOOK Username of the user who created the record.';
comment on column sec.menu_items.created_at is '@DOCBOOK Date and time the record was created.';
comment on column sec.menu_items.updated_by is '@DOCBOOK Username of user who last updated the record.';
comment on column sec.menu_items.updated_at is '@DOCBOOK Date and time the record was last updated.';

select rlm.component_registered('SEC', 'tab_menu_items.sql');
