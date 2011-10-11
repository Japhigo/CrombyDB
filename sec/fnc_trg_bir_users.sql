\qecho Creating BIR trigger function for users

select rlm.register_component('SEC', 'fnc_trg_bir_users.sql' );

create or replace function sec.bir_users()
  returns trigger
  security definer
as $bir_users$
  declare

    v_timestamp  timestamp   := current_timestamp;
    v_user       varchar(30) := session_user;

  begin

    select uuid_generate_v1() into new.user_uuid;

    if new.created_by is null
    then
      new.created_by := v_user;
    end if;

    if new.updated_by is null
    then
      new.updated_by := v_user;
    end if;

    new.created_at := v_timestamp;
    new.updated_at := v_timestamp;

    return new;

  end;
$bir_users$ LANGUAGE plpgsql;

comment on function sec.bir_users() is '@DOCBOOK Before Insert Row trigger to populate columns in <link linkend="sec-table-users">USERS.</link>.';

select rlm.component_registered('SEC', 'fnc_trg_bir_users.sql');
