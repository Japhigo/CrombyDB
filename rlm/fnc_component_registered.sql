\qecho Creating function component_registered

create or replace function rlm.component_registered
  (p_component_type_code  varchar(3)
  ,p_component_name  varchar(255))
  returns void
as $$
  declare

    v_component_id   int;
    v_db_release_id  int;

    c_drc cursor
      (p_name        varchar(255)
      ,p_type        varchar(3)
      ,p_release_id  int)
    is
      select drc.id
        from rlm.db_release_components drc join
             rlm.db_component_areas dca on dca.id = drc.db_component_area_id
       where drc.db_release_id = p_release_id 
         and drc.component_name = p_name
         and dca.component_area_code = p_type
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

    open c_drc
      (p_component_name
      ,p_component_type_code
      ,v_db_release_id);
    fetch c_drc into v_component_id;
    close c_drc;

    update rlm.db_release_components
       set end_date_time = current_timestamp
     where id = v_component_id;

  end;
$$ language plpgsql;

comment on function rlm.component_registered
  (p_component_type_code  varchar(3)
  ,p_component_name  varchar(255)) is '@DOCBOOK Function to mark the installation of a Cromby database object as complete.';

