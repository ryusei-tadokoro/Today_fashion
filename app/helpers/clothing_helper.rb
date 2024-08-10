# app/helpers/clothing_helper.rb

module ClothingHelper
  def very_cold_set
    [
      image_tag('knitcap.png', size: '50x50'),
      image_tag('down.png', size: '50x50'),
      image_tag('muffler.png', size: '50x50'),
      image_tag('cardigan.png', size: '50x50'),
      image_tag('Y-shirts.png', size: '50x50'),
      image_tag('tebukuro.png', size: '50x50'),
      image_tag('jeans.png', size: '50x50'),
      image_tag('black_shoes.png', size: '50x50')
    ]
  end

  def cool_set
    [
      image_tag('chester_coat.png', size: '50x50'),
      image_tag('muffler.png', size: '50x50'),
      image_tag('cardigan.png', size: '50x50'),
      image_tag('Y-shirts.png', size: '50x50'),
      image_tag('tebukuro.png', size: '50x50'),
      image_tag('jeans.png', size: '50x50'),
      image_tag('black_shoes.png', size: '50x50')
    ]
  end

  def mild_set
    [
      image_tag('flight_jacket.png', size: '50x50'),
      image_tag('cardigan.png', size: '50x50'),
      image_tag('Y-shirts.png', size: '50x50'),
      image_tag('jeans.png', size: '50x50'),
      image_tag('black_shoes.png', size: '50x50')
    ]
  end

  def warm_set
    [
      image_tag('cardigan.png', size: '50x50'),
      image_tag('Y-shirts.png', size: '50x50'),
      image_tag('jeans.png', size: '50x50'),
      image_tag('black_shoes.png', size: '50x50')
    ]
  end

  def very_hot_set
    [
      image_tag('cloth_longt.png', size: '50x50'),
      image_tag('black_pants.png', size: '50x50'),
      image_tag('white_shoes.png', size: '50x50')
    ]
  end

  def extreme_hot_set
    [
      image_tag('fashion_tshirt1_white.png', size: '50x50'),
      image_tag('black_pants.png', size: '50x50'),
      image_tag('white_shoes.png', size: '50x50')
    ]
  end

  def tropical_set
    [
      image_tag('hat_kankan', size: '50x50'),
      image_tag('fashion_tshirt1_white.png', size: '50x50'),
      image_tag('half_pants.png', size: '50x50'),
      image_tag('shoes_side06_beach.png', size: '50x50'),
      image_tag('pool_bath_towel.png', size: '50x50')
    ]
  end
end
