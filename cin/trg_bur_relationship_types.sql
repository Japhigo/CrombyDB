\qecho Creating BUR trigger for relationship_types

select rlm.register_component ( 'CIN', 'trg_bur_relationship_types.sql' );

create trigger bur_relationship_types before update on cin.relationship_types
  for each row execute procedure cin.bur_data_statuses();

select rlm.component_registered ( 'trg_bur_relationship_types.sql' );
