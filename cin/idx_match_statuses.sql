\qecho Creating indexes on match_statuses

select rlm.register_component ( 'CIN', 'idx_match_statuses.sql' );

create unique index match_statuses_match_status_idx on cin.match_statuses ( upper ( match_status ) );

select rlm.component_registered ( 'idx_match_statuses.sql' );
