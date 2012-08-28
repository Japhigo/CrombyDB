\qecho Creating view on menus

select rlm.register_component('PUB', 'viw_menus.sql');

create or replace view public.vw_menus
as
  select men.id
        ,men.menu_name
        ,mes.menu_set_name
    from sec.menu_sets mes join
         sec.menus men on men.menu_set_id = mes.id;

comment on view public.vw_menus is '@DOCBOOK Cromby Menus and menu sets.';

select rlm.component_registered('PUB', 'viw_menus.sql');
