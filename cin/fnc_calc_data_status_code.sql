\qecho Creating function calc_data_status_code

select rlm.register_component('CIN', 'fnc_calc_data_status_code.sql');

create or replace function cin.calc_data_status_code
  (p_old_data_status_code     smallint
  ,p_new_data_status_code     smallint
  ,p_new_effective_from_date  date
  ,p_old_effective_to_date    date
  ,p_new_effective_to_date    date
  )
  returns smallint
as $$
  declare

    l_data_status_code  smallint;

  begin

    --
    -- 1 = created
    -- 2 = updated
    -- 3 = end-dated

    if p_old_data_status_code = coalesce(p_new_data_status_code, p_old_data_status_code)
    then
      if p_old_data_status_code = -1
      then
        l_data_status_code := 0;
    
      elsif p_old_data_status_code = 0
      then
        l_data_status_code := 3;

      elsif p_old_data_status_code = 1
      then
        l_data_status_code := 2;
      
      else
        l_data_status_code := p_old_data_status_code;
      end if;
    else
      l_data_status_code := p_new_data_status_code;
    end if;

    return l_data_status_code;

  end;
$$ language plpgsql;

select rlm.component_registered('fnc_calc_data_status_code.sql');

