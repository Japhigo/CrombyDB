\qecho Creating function component_registered

create or replace function rlm.component_registered
  (p_component_name  varchar(255))
  returns void
as $$
  declare

    v_component_id   int;
    v_db_release_id  int;

    c_drc cursor
      (p_name  varchar(255))
    is
      select id
        from rlm.db_release_components
       where component_name = p_name
       order by id desc;

    c_drl cursor
    for
      select id
        from rlm.db_releases
       order by id desc;

  begin

    open c_drl;
    fetch c_drl into v_db_release_id;
    close c_drl;

    open c_drc(p_component_name);
    fetch c_drc into v_component_id;
    close c_drc;

    update rlm.db_release_components
       set end_date_time = current_timestamp
     where id = v_component_id
       and db_release_id = v_db_release_id;

  end;
$$ language plpgsql;

