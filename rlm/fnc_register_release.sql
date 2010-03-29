\qecho Creating function register_release

create or replace function rlm.register_release ()
	returns void
as $$
  declare

    c_trd cursor
    for
      select major_id
	        ,minor_id
	        ,sub_id
	        ,description
	        ,release_notes_url
	    from tmp_release_details;

    r_trd  tmp_release_details%rowtype;

  begin

    open c_trd;
    fetch c_trd into r_trd;
    close c_trd;

    insert into rlm.db_releases
	  ( major_id
	  , minor_id
	  , sub_id
	  , description
	  , release_notes_url
	  , installed_by
      )
    values
	  ( r_trd.major_id
	  , r_trd.minor_id
	  , r_trd.sub_id
	  , r_trd.description
	  , r_trd.release_notes_url
      , session_user
      );
  end;
$$ language plpgsql;
