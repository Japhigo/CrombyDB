\qecho Inserting Menus...

select rlm.register_component('SEC', 'ins_menus.sql');

begin;
insert into sec.menus(menu_set_id, menu_name) select id,'Reference Data' from menu_sets where menu_set_name = 'AM_MAIN_MENU';
insert into sec.menus(menu_set_id, menu_name) select id,'Employee Maintenance' from menu_sets where menu_set_name = 'AM_MAIN_MENU';
insert into sec.menus(menu_set_id, menu_name) select id,'User Maintenance' from menu_sets where menu_set_name = 'AM_MAIN_MENU';
insert into sec.menus(menu_set_id, menu_name) select id,'System Administration' from menu_sets where menu_set_name = 'AM_MAIN_MENU';
commit;

select rlm.component_registered('SEC', 'ins_menus.sql');

\qecho Menus inserted
