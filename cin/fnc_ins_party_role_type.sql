\echo Creating function ins_party_role_type

select rlm.register_component('CIN', 'fnc_ins_party_role_type.sql');

create or replace function cin.ins_party_role_type
  (p_id                              int  
  ,p_display                         varchar(30)
  ,p_description                     varchar(255)
  ,p_party_object_type_id            int
  ,p_effective_from_date             date
  ,p_effective_to_date               date
  ,p_created_by                      varchar(30)
  ,p_created_at                      timestamp
  ,p_updated_by                      varchar(30)
  ,p_updated_at                      timestamp
  )
  returns void
  security definer
as $$
  begin

    insert into cin.party_role_types
      (id
      ,display
      ,description
      ,party_object_type_id
      ,effective_from_date
      ,effective_to_date
      ,created_by
      ,created_at
      ,updated_by
      ,updated_at
      ,data_status_code
      )
    values
      (p_id
      ,p_display
      ,p_description
      ,p_party_object_type_id
      ,p_effective_from_date
      ,p_effective_to_date
      ,p_created_by
      ,p_created_at
      ,p_updated_by
      ,p_updated_at
      ,1
      );

  end;
$$ language plpgsql;

comment on function cin.ins_party_role_type
  (p_id                              int  
  ,p_code                            varchar(10)
  ,p_display                         varchar(30)
  ,p_description                     varchar(255)
  ,p_party_object_type_id            int
  ,p_effective_from_date             date
  ,p_effective_to_date               date
  ,p_created_by                      varchar(30)
  ,p_created_at                      timestamp
  ,p_updated_by                      varchar(30)
  ,p_updated_at                      timestamp
  )
  is '@DOCBOOK Function to insert a Party Role Type.';

select rlm.component_registered('CIN', 'fnc_ins_party_role_type.sql');
