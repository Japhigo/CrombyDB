\qecho Creating permissions...

select rlm.register_component('PUB', 'public_grants.sql');

\qecho Assign permissions to am_user

grant select on public.vw_party_object_types to am_user;
grant select on public.vw_menus to am_user;
grant select on public.vw_menu_items to am_user;
grant select, insert, update, update, delete on public.role_types to am_user;
grant usage on sequence public.role_types_id_seq to am_user;
grant execute on function public.ins_party_role_type_api
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
  to am_user;

\qecho Assign permissions to um_user

grant select on public.vw_menus to um_user;
grant select on public.vw_menu_items to um_user;
grant select on public.vw_party_role_types to um_user;

select rlm.component_registered('PUB', 'public_grants.sql');

\qecho Permissions created
