\qecho Creating function register_component

create or replace function rlm.register_component
  (p_component_type_code  varchar(3)
  ,p_component_name       varchar(255)
  )
  returns void
as $$
  declare

    v_db_component_area_id  int;
    v_db_release_id         int;

    c_drl cursor
    for
      select id
        from rlm.db_releases
       order by id desc;

    c_dca cursor
      (p_type  varchar(3))
    for
      select id
        from rlm.db_component_areas
       where component_area_code = p_type;

  begin

    open c_drl;
    fetch c_drl into v_db_release_id;
    close c_drl;

    open c_dca(p_component_type_code);
    fetch c_dca into v_db_component_area_id;
    close c_dca;

    insert into rlm.db_release_components
      (db_release_id
      ,db_component_area_id
      ,component_name
      ,installed_by
      )
    values
      (v_db_release_id
      ,v_db_component_area_id
      ,p_component_name
      ,session_user
      );

  end;
$$ language plpgsql;

comment on function rlm.register_component
  (p_component_type_code  varchar(3)
  ,p_component_name  varchar(255)) is '@DOCBOOK Function to mark the start of the installation of a Cromby database object.';

