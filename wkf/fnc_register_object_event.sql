\qecho Creating function register_object_event

select rlm.register_component('WKF', 'fnc_register_object_event.sql' );

create or replace function wkf.register_object_event
  (p_object_type   text
  ,p_object_id     int
  ,p_object_event  text
  )
  returns void
as $$
  declare

    v_dummy  int;

  begin

    null;

  end;
$$ language plpgsql;

comment on function function wkf.register_object_event
  (p_object_type   text
  ,p_object_id     int
  ,p_object_event  text
  ) is '@DOCBOOK Function to trigger workflow items in response to object events.';

select rlm.component_registered('WKF', 'fnc_register_object_event.sql');
