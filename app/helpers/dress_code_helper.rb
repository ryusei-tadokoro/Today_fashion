# app/helpers/dress_code_helper.rb
module DressCodeHelper
  def dress_code_suggestion(temperature, constitution_id)
    adjusted_temp = adjust_temperature(temperature, constitution_id)
    icon_tags = select_clothing_set(adjusted_temp)
    safe_join(icon_tags, ' ')
  end

  private

  def adjust_temperature(temperature, constitution_id)
    case constitution_id
    when 1 then temperature + 2 # 寒がり
    when 2 then temperature + 1 # やや寒がり
    when 4 then temperature - 1 # やや暑がり
    when 5 then temperature - 2 # 暑がり
    else
      temperature
    end
  end

  def select_clothing_set(adjusted_temp)
    case adjusted_temp
    when ...5 then very_cold_set
    when 5...13 then cool_set
    when 13...17 then mild_set
    when 17...24 then warm_set
    when 24...28 then very_hot_set
    when 28...33 then extreme_hot_set
    else tropical_set
    end
  end
end
