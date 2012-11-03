\echo Creating function del_party_role_type

select rlm.register_component('CIN', 'fnc_del_party_role_type.sql');

create or replace function cin.del_party_role_type
  (p_id  int)
  returns void
  security definer
as $$
  begin

    update cin.party_role_types
    set    effective_to_date = effective_from_date -1
          ,data_status_code = -1
    where  id = p_id;

  end;
$$ language plpgsql;

comment on function cin.del_party_role_type
  (p_id  int)
  is '@DOCBOOK Function to logically delete a Party Role Type.';

select rlm.component_registered('CIN', 'fnc_del_party_role_type.sql');
