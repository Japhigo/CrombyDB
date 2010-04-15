\qecho Creating BUR trigger for relationship_statuses

select rlm.register_component ( 'CIN', 'trg_bur_relationship_statuses.sql' );

create trigger bur_relationship_statuses before update on cin.relationship_statuses
  for each row execute procedure cin.bur_data_statuses();

select rlm.component_registered ( 'trg_bur_relationship_statuses.sql' );
