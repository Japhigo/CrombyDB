\qecho Inserting Menu Sets...

select rlm.register_component('SEC', 'ins_menu_sets.sql');

begin;
insert into sec.menu_sets(menu_set_name) values ('AM_MAIN_MENU');
insert into sec.menu_sets(menu_set_name) values ('UM_MAIN_MENU');
commit;

select rlm.component_registered('SEC', 'ins_menu_sets.sql');

\qecho Menu Sets inserted
