\qecho Creating indexes on controllers

select rlm.register_component ('SEC', 'idx_controllers.sql');

create unique index controllers_controller_idx on sec.controllers(lower(controller));

select rlm.component_registered('SEc', 'idx_controllers.sql');
