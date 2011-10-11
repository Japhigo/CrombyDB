\qecho Creating BIR trigger for menus

select rlm.register_component('SEC', 'trg_bir_menus.sql');

create trigger bir_menus before insert on sec.menus
  for each row execute procedure sec.bir_sec_audit();

comment on trigger bir_menus on sec.menus is '@DOCBOOK Before Insert Row to check audit columns';

select rlm.component_registered('SEC', 'trg_bir_menus.sql');
