\qecho Creating table logger_entries

select rlm.register_component ( 'CIN', 'tab_logger_entries.sql' );

create table pub.logger_entries
  ( log_date                        timestamp
  , logger                          text
  , priority                        varchar(30)
  , message                         text
  );

select rlm.component_registered ( 'tab_logger_entries.sql' );
