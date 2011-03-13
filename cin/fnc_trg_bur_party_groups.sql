\qecho Creating BUR trigger function for creating party group histories

select rlm.register_component('CIN', 'fnc_trg_bur_party_groups.sql');

create or replace function cin.bur_party_groups()
  returns trigger
as $bur_party_groups$
  begin
    
    select cin.calc_data_status_code
      (old.data_status_code
      ,new.data_status_code
      )
      into new.data_status_code;

    if new.updated_by is null
    then
      new.updated_by := session_user;
    end if;

    new.updated_at := current_timestamp;

    insert into cin.party_group_histories
      (party_group_id
      ,effective_date
      ,dissolved_date
      ,party_group_type_id
      ,member_count
      ,created_by
      ,created_at
      ,updated_by
      ,updated_at
      ,data_status_code
      )
    values
      (old.id
      ,old.effective_date
      ,old.dissolved_date
      ,old.party_group_type_id
      ,old.member_count
      ,old.created_by
      ,old.created_at
      ,old.updated_by
      ,old.updated_at
      ,old.data_status_code
      );

    return new;

  end;
$bur_party_groups$ LANGUAGE plpgsql;

select rlm.component_registered('fnc_trg_bur_party_groups.sql');
