\qecho Inserting Menu Items...

select rlm.register_component('SEC', 'ins_menu_items.sql');

begin;
insert into sec.menu_items(menu_id, controller_id) select sme.id as menu_id , con.id as controller_id from sec.menus sme, sec.controllers con where sme.menu_name = 'Reference Data' and con.controller = 'ref_data_tables';
commit;

select rlm.component_registered('SEC', 'ins_menu_items.sql');

\qecho Menu Items inserted
