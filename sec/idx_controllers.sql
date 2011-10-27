\qecho Creating indexes on controllers

select rlm.register_component ('SEC', 'idx_controllers.sql');

create unique index controllers_controller_idx on sec.controllers(lower(controller));

comment on index sec.controllers_controller_idx is '@DOCBOOK Index to enforce uniqueness of CONTROLLERS.CONTROLLER.';

select rlm.component_registered('SEC', 'idx_controllers.sql');
