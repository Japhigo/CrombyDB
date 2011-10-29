\qecho Creating function calc_data_status_code

select rlm.register_component('CIN', 'fnc_calc_data_status_code.sql');

create or replace function cin.calc_data_status_code
  (p_old_data_status_code   smallint
  ,p_new_data_status_code   smallint
  ,p_effective_from_date    date
  ,p_old_effective_to_date  date
  ,p_new_effective_to_date  date
  )
  returns smallint
as $$
  declare

    l_data_status_code  smallint;

  begin

    if p_new_data_status_code != -1
    then
      if p_old_effective_to_date is null and
         p_new_effective_to_date is null
      then
        l_data_status_code := 2;

      elsif p_old_effective_to_date is null and
            p_new_effective_to_date is not null and
            p_new_effective_to_date >= p_effective_from_date
      then
        l_data_status_code := 3;

      elsif p_old_effective_to_date is not null and
            p_new_effective_to_date is null
      then
        l_data_status_code := 4;

      elsif p_old_effective_to_date is null and
            p_new_effective_to_date is not null and
            p_new_effective_to_date < p_effective_from_date
      then
        l_data_status_code := 5;

      else
        l_data_status_code := p_old_data_status_code;
      end if;
    else
      l_data_status_code := p_old_data_status_code;
    end if;

    return l_data_status_code;

  end;
$$ language plpgsql;

comment on function cin.calc_data_status_code
  (p_old_data_status_code   smallint
  ,p_new_data_status_code   smallint
  ,p_effective_from_date    date
  ,p_old_effective_to_date  date
  ,p_new_effective_to_date  date
  ) is '@DOCBOOK Function to calculate the Data Status Code on update.';

select rlm.component_registered('CIN', 'fnc_calc_data_status_code.sql');

