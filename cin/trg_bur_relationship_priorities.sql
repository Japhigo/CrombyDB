\qecho Creating BUR trigger for relationship_priorities

select rlm.register_component ( 'CIN', 'trg_bur_relationship_priorities.sql' );

create trigger bur_relationship_priorities before update on cin.relationship_priorities
  for each row execute procedure cin.bur_data_statuses();

select rlm.component_registered ( 'trg_bur_relationship_priorities.sql' );
