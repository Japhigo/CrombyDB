\qecho Creating function current_version

create or replace function public.current_version ()
	returns varchar(30)
	security definer
as $$
  declare

    v_db_release  varchar(30);

    c_drl cursor
    for
      select ltrim ( to_char ( major_id, '999' ) ) || '.' || 
             ltrim ( to_char ( minor_id, '999' ) ) || '.' ||
             ltrim ( to_char ( sub_id, '999' ) ) as db_release
        from rlm.db_releases;

  begin

    open c_drl;
    fetch c_drl into v_db_release;
    close c_drl;

    return v_db_release;

  end;
$$ language plpgsql;


