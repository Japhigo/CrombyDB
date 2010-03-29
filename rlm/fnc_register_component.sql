\qecho Creating function register_component

create or replace function rlm.register_component
    ( p_component_type_code  char(3)
    , p_component_name       varchar(255)
    )
    returns void
as $$
  declare

    v_db_release_id      int;

    c_drl cursor
    for
      select id
	    from rlm.db_releases
	   order by id desc;

  begin

    open c_drl;
    fetch c_drl into v_db_release_id;
    close c_drl;

    insert into rlm.db_release_components
	  ( db_release_id
	  , component_type_code
	  , component_name
	  , installed_by
      )
    values
	  ( v_db_release_id
	  , p_component_type_code
	  , p_component_name
      , session_user
      );

  end;
$$ language plpgsql;


