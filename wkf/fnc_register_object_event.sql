\qecho Creating function register_object_event

select rlm.register_component('WKF', 'fnc_register_object_event.sql' );

create or replace function wkf.register_object_event
  (p_object_table_name  varchar(255)
  ,p_object_id          int
  ,p_object_event_code  varchar(255)
  ,p_object_event_data  text
  )
  returns void
as $$
  begin

    insert into object_events_register
      (object_table_name
      ,object_id
      ,object_event_code
      ,object_event_data
      ,processed
      ,created_at
      )
    values
      (p_object_table_name
      ,p_object_id
      ,p_object_event_code
      ,p_object_event_data
      ,false
      ,current_timestamp
      );

  end;
$$ language plpgsql;

comment on function wkf.register_object_event
  (p_object_table_name  varchar(255)
  ,p_object_id          int
  ,p_object_event_code  varchar(255)
  ,p_object_event_data  text
  ) is '@DOCBOOK Function to trigger workflow items in response to object events.';

select rlm.component_registered('WKF', 'fnc_register_object_event.sql');
