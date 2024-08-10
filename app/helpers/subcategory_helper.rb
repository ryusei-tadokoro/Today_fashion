# app/helpers/subcategory_helper.rb

module SubcategoryHelper
  def get_subcategory_ids(temperature, constitution_id)
    adjusted_temp = adjust_temperature(temperature, constitution_id)

    case adjusted_temp
    when ...5 then [18, 7, 2, 10, 6]
    when 5...13 then [18, 7, 2, 10, 29]
    when 13...17 then [17, 6, 8, 11, 35]
    when 17...24 then [17, 6, 2, 29, 11]
    when 24...28 then [20, 1, 10, 29]
    when 28...33 then [1, 11, 29]
    else []
    end
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
end
