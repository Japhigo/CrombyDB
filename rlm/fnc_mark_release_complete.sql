\qecho Creating function mark_release_complete

create or replace function rlm.mark_release_complete()
  returns void
as $$
  declare

    v_db_release_id  int;

    c_drl cursor
    for
      select id
        from rlm.db_releases
       order by id desc;

  begin

    open c_drl;
    fetch c_drl into v_db_release_id;
    close c_drl;

    update rlm.db_releases
       set end_date_time = current_timestamp
     where id = v_db_release_id;

  end;
$$ language plpgsql;

