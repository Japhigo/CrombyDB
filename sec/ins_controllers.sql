\qecho Inserting Controllers...

select rlm.register_component('SEC', 'ins_controllers.sql');

begin;
insert into sec.controllers(controller, description) values ('home', 'Cromby Administration Module home page');
insert into sec.controllers(controller, description) values ('ref_data_tables', 'Maintain Reference Data Tables');
insert into sec.controllers(controller, description) values ('genders', 'Maintain Genders Table');
commit;

select rlm.component_registered('SEC', 'ins_controllers.sql');

\qecho Controllers inserted
