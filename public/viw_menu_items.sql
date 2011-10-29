\qecho Creating view on menu items

select rlm.register_component('PUB', 'viw_menu_items.sql');

create or replace view public.vw_menu_items
as
  select ctr.controller
        ,ctr.description
        ,mei.id
        ,mei.menu_id as vw_menu_id
    from sec.menu_items mei join
         sec.controllers ctr on ctr.id = mei.controller_id;

comment on view public.vw_menu_items is '@DOCBOOK Cromby Menu items.';

select rlm.component_registered('PUB', 'viw_menu_items.sql');
