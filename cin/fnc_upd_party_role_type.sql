\echo Creating function upd_party_role_type

select rlm.register_component('CIN', 'fnc_upd_party_role_type.sql');

create or replace function cin.upd_party_role_type
  (p_id                              int  
  ,p_code                            varchar(10)
  ,p_display                         varchar(30)
  ,p_description                     varchar(255)
  ,p_effective_from_date             date
  ,p_effective_to_date               date
  ,p_updated_by                      varchar(30)
  ,p_updated_at                      timestamp
  )
  returns void
  security definer
as $$
  begin

    update cin.party_role_types
    set    code = p_code
          ,display = p_display
          ,description = p_description
          ,effective_from_date = p_effective_from_date
          ,effective_to_date = p_effective_to_date
          ,updated_by = p_updated_by
          ,updated_at = p_updated_at
    where  id = p_id;

  end;
$$ language plpgsql;

comment on function cin.upd_party_role_type
  (p_id                              int  
  ,p_code                            varchar(10)
  ,p_display                         varchar(30)
  ,p_description                     varchar(255)
  ,p_effective_from_date             date
  ,p_effective_to_date               date
  ,p_updated_by                      varchar(30)
  ,p_updated_at                      timestamp
  )
  is '@DOCBOOK Function to update a Party Role Type.';

select rlm.component_registered('CIN', 'fnc_upd_party_role_type.sql');
