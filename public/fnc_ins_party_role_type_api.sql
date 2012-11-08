\echo Creating function ins_party_role_type_api

select rlm.register_component('PUB', 'fnc_ins_party_role_type_api.sql');

create or replace function public.ins_party_role_type_api
  (p_code                            varchar(10)
  ,p_display                         varchar(30)
  ,p_description                     varchar(255)
  ,p_party_object_type_code          varchar(3)
  ,p_internal                        boolean
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
  declare

    v_party_object_type_id  int;

  begin

    select cin.party_object_type_id
           (p_party_object_type_code
           ,p_internal
           )
      into v_party_object_type_id;

    select cin.ins_party_role_type
           (public.role_types_id_seq.nextval
           ,p_code
           ,p_display
           ,p_description
           ,v_party_object_type_id
           ,p_effective_from_date
           ,p_effective_to_date
           ,p_created_by
           ,p_created_at
           ,p_updated_by
           ,p_updated_at
           );

  end;
$$ language plpgsql;

comment on function public.ins_party_role_type_api
  (p_code                            varchar(10)
  ,p_display                         varchar(30)
  ,p_description                     varchar(255)
  ,p_party_object_type_code          varchar(3)
  ,p_internal                        boolean
  ,p_effective_from_date             date
  ,p_effective_to_date               date
  ,p_created_by                      varchar(30)
  ,p_created_at                      timestamp
  ,p_updated_by                      varchar(30)
  ,p_updated_at                      timestamp
  )
  is '@DOCBOOK API Function to insert a Party Role Type.';

select rlm.component_registered('PUB', 'fnc_ins_party_role_type_api.sql');
