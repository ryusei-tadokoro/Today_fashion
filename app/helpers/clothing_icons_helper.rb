# app/helpers/clothing_icons_helper.rb

module ClothingIconsHelper
  def get_clothing_icons(temperature, constitution_id)
    adjusted_temp = adjust_temperature(temperature, constitution_id)
    icon_tag_for_temperature(adjusted_temp)
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

  def icon_tag_for_temperature(temperature)
    case temperature
    when ...5 then icon_for_coldest
    when 5...13  then icon_for_cold
    when 13...17 then icon_for_cool
    when 17...24 then icon_for_mild
    when 24...28 then icon_for_hot
    when 28...33 then icon_for_very_hot
    else
      icon_for_hottest
    end
  end

  def icon_for_coldest
    [image_tag('knitcap_down.png', size: '50x50')]
  end

  def icon_for_cold
    [image_tag('chester_coat.png', size: '50x50')]
  end

  def icon_for_cool
    [image_tag('flight_jacket.png', size: '50x50')]
  end

  def icon_for_mild
    [image_tag('cardigan.png', size: '50x50')]
  end

  def icon_for_hot
    [image_tag('cloth_longt.png', size: '50x50')]
  end

  def icon_for_very_hot
    [image_tag('fashion_tshirt1_white.png', size: '50x50')]
  end

  def icon_for_hottest
    [image_tag('hat_kankan_T-shirt.png', size: '50x50')]
  end
end
