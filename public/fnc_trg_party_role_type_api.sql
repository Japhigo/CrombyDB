\echo Creating function trg_party_role_type_api

select rlm.register_component('PUB', 'fnc_trg_party_role_type_api.sql');

create or replace function public.trg_party_role_type_api()
  returns trigger
  security definer
as $function$
  declare

    v_party_object_type_id  int;

  begin

    if tg_op = 'INSERT'
    then
      select cin.party_object_type_id
             (new.party_object_type_code
             ,new.internal
             )
        into v_party_object_type_id;

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
        (nextval('public.role_types_id_seq'::regclass)
        ,new.display
        ,new.description
        ,v_party_object_type_id
        ,new.effective_from_date
        ,new.effective_to_date
        ,new.created_by
        ,new.created_at
        ,new.updated_by
        ,new.updated_at
        ,1
        );

      return new;

    elsif tg_op = 'UPDATE'
    then
      update cin.party_role_types
      set    display = new.display
            ,description = new.description
            ,effective_from_date = new.effective_from_date
            ,effective_to_date = new.effective_to_date
            ,updated_by = new.updated_by
            ,updated_at = new.updated_at
      where  id = new._id;

      return new;
    
    elsif tg_op = 'DELETE'
    then
      update cin.party_role_types
      set    effective_to_date = effective_from_date -1
            ,data_status_code = -1
      where  id = new.id;
  
      return null;

    end if;

    return new;
  end;
$function$ language plpgsql;

comment on function trg_party_role_type_api() is '@DOCBOOK API Trigger Function to insert, update, or delete a Party Role Type.';

select rlm.component_registered('PUB', 'fnc_trg_party_role_type_api.sql');
