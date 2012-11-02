\qecho Creating permissions...

select rlm.register_component('PUB', 'public_grants.sql');

\qecho Assign permissions to am_user

grant select on public.vw_party_object_types to am_user;
grant select on public.vw_menus to am_user;
grant select on public.vw_menu_items to am_user;
grant select, insert, update, update, delete on public.role_types to am_user;
grant usage on public.role_types_id_seq to am_user;

\qecho Assign permissions to um_user

grant select on public.vw_menus to um_user;
grant select on public.vw_menu_items to um_user;
grant select on public.vw_party_role_types to um_user;

select rlm.component_registered('PUB', 'public_grants.sql');

\qecho Permissions created
