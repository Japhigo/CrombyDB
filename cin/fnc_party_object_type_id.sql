\echo Creating function party_object_type_id

select rlm.register_component('CIN', 'fnc_party_object_type_id.sql');

create or replace function cin.party_object_type_id
  (p_party_object_type_code  varchar(3)
  ,p_internal                boolean
  )
  returns int
  security definer
as $$
  declare

    c_pot cursor
      (p_party_object_type_code  varchar(3)
      ,p_internal                boolean
      )
    for
      select id
      from   cin.party_obect_types
      where  party_object_type_code = p_party_object_type_code
      and    internal = p_internal;

    v_party_object_type_id  int;

  begin

    open c_pot
      (p_party_object_type_code
      ,p_internal
      );
    fetch c_pot into v_party_object_type_id;
    close c_pot;

    return v_party_object_type_id;

  end;
$$ language plpgsql;

comment on function cin.party_object_type_id
  (p_party_object_type_code  varchar(3)
  ,p_internal                boolean
  )
  is '@DOCBOOK Function to retrieve a Party Object Type ID.';

select rlm.component_registered('CIN', 'fnc_party_object_type_id.sql');
