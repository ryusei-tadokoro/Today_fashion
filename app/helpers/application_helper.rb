# frozen_string_literal: true

module ApplicationHelper
  def kelvin_to_celsius(kelvin)
    kelvin - 273.15
  end

  def dress_code_suggestion(temperature, constitution_id)
    icon_tags = []
    suggestion = ''
    case constitution_id
    when 1 # 暑がり
      if temperature < 3
        icon_tags = [
          image_tag('knitcap.png', size: '50x50'),
          image_tag('down.png', size: '50x50'),
          image_tag('muffler.png', size: '50x50'),
          image_tag('cardigan.png', size: '50x50'),
          image_tag('Y-shirts.png', size: '50x50'),
          image_tag('tebukuro.png', size: '50x50'),
          image_tag('hokkairo.png', size: '50x50'),
          image_tag('jeans.png', size: '50x50'),
          image_tag('black_shoes.png', size: '50x50')
        ]
        suggestion = '厳しい寒さ,ダウンジャケットは必須！！'
      elsif temperature >= 3 && temperature < 7
        icon_tags = [
          image_tag('chester_coat.png', size: '50x50'),
          image_tag('muffler.png', size: '50x50'),
          image_tag('cardigan.png', size: '50x50'),
          image_tag('Y-shirts.png', size: '50x50'),
          image_tag('tebukuro.png', size: '50x50'),
          image_tag('jeans.png', size: '50x50'),
          image_tag('black_shoes.png', size: '50x50')
        ]
        suggestion = 'とても寒い,今日はマフラー手袋などで寒さ対策必要'
      elsif temperature >= 7 && temperature < 11
        icon_tags = [
          image_tag('chester_coat.png', size: '50x50'),
          image_tag('muffler.png', size: '50x50'),
          image_tag('cardigan.png', size: '50x50'),
          image_tag('Y-shirts.png', size: '50x50'),
          image_tag('tebukuro.png', size: '50x50'),
          image_tag('jeans.png', size: '50x50'),
          image_tag('black_shoes.png', size: '50x50')
        ]
        suggestion = '寒い,コートを着ないと結構寒いわ'
      elsif temperature >= 11 && temperature < 15
        icon_tags = [
          image_tag('flight_jacket.png', size: '50x50'),
          image_tag('cardigan.png', size: '50x50'),
          image_tag('Y-shirts.png', size: '50x50'),
          image_tag('jeans.png', size: '50x50'),
          image_tag('black_shoes.png', size: '50x50')
        ]
        suggestion = 'じんわり冷える寒さ,薄手のアウターがちょうどいいかも'
      elsif temperature >= 15 && temperature < 18
        icon_tags = [
          image_tag('cardigan.png', size: '50x50'),
          image_tag('Y-shirts.png', size: '50x50'),
          image_tag('jeans.png', size: '50x50'),
          image_tag('black_shoes.png', size: '50x50')
        ]
        suggestion = '程よい気温,カーディガンなど薄手のものがちょうどいいかも'
      elsif temperature >= 18 && temperature < 22
        icon_tags = [
          image_tag('parker.png', size: '50x50'),
          image_tag('Y-shirts.png', size: '50x50'),
          image_tag('black_pants.png', size: '50x50'),
          image_tag('white_shoes.png', size: '50x50')
        ]
        suggestion = '昼間の気温は快適,一応薄手のカーディガンやパーカーがあるといいかも'
      elsif temperature >= 22 && temperature < 26
        icon_tags = [
          image_tag('cloth_longt.png', size: '50x50'),
          image_tag('black_pants.png', size: '50x50'),
          image_tag('white_shoes.png', size: '50x50')
        ]
        suggestion = 'じんわり暑い,薄手の長袖がちょうどいいんじゃ'
      elsif temperature >= 26 && temperature < 31
        icon_tags = [
          image_tag('fashion_tshirt1_white.png', size: '50x50'),
          image_tag('black_pants.png', size: '50x50'),
          image_tag('white_shoes.png', size: '50x50')
        ]
        suggestion = 'とても暑い,半袖で十分'
      else
        suggestion = '危険な暑さ,ノースリーブや短パンでも暑いから,熱中症に気をつけて！!'
        icon_tags = [
          image_tag('hat_kankan', size: '50x50'),
          image_tag('fashion_tshirt1_white.png', size: '50x50'),
          image_tag('half_pants.png', size: '50x50'),
          image_tag('shoes_side06_beach.png', size: '50x50'),
          image_tag('pool_bath_towel.png', size: '50x50')
        ]
      end

    when 2 # やや暑がり
      if temperature < 4
        icon_tags = [
          image_tag('knitcap.png', size: '50x50'),
          image_tag('down.png', size: '50x50'),
          image_tag('muffler.png', size: '50x50'),
          image_tag('cardigan.png', size: '50x50'),
          image_tag('Y-shirts.png', size: '50x50'),
          image_tag('tebukuro.png', size: '50x50'),
          image_tag('hokkairo.png', size: '50x50'),
          image_tag('jeans.png', size: '50x50'),
          image_tag('black_shoes.png', size: '50x50')
        ]
        suggestion = '厳しい寒さ,ダウンジャケットは必須！！'
      elsif temperature >= 4 && temperature < 8
        icon_tags = [
          image_tag('down.png', size: '50x50'),
          image_tag('muffler.png', size: '50x50'),
          image_tag('cardigan.png', size: '50x50'),
          image_tag('Y-shirts.png', size: '50x50'),
          image_tag('tebukuro.png', size: '50x50'),
          image_tag('jeans.png', size: '50x50'),
          image_tag('black_shoes.png', size: '50x50')
        ]
        suggestion = 'とても寒い,今日はマフラー手袋などで寒さ対策必要'
      elsif temperature >= 8 && temperature < 12
        icon_tags = [
          image_tag('chester_coat.png', size: '50x50'),
          image_tag('muffler.png', size: '50x50'),
          image_tag('cardigan.png', size: '50x50'),
          image_tag('Y-shirts.png', size: '50x50'),
          image_tag('tebukuro.png', size: '50x50'),
          image_tag('jeans.png', size: '50x50'),
          image_tag('black_shoes.png', size: '50x50')
        ]
        suggestion = '寒い,コートを着ないと結構寒いわ'
      elsif temperature >= 12 && temperature < 16
        icon_tags = [
          image_tag('flight_jacket.png', size: '50x50'),
          image_tag('cardigan.png', size: '50x50'),
          image_tag('Y-shirts.png', size: '50x50'),
          image_tag('jeans.png', size: '50x50'),
          image_tag('black_shoes.png', size: '50x50')
        ]
        suggestion = 'じんわり冷える寒さ,薄手のアウターがちょうどいいかも'
      elsif temperature >= 16 && temperature < 19
        icon_tags = [
          image_tag('cardigan.png', size: '50x50'),
          image_tag('Y-shirts.png', size: '50x50'),
          image_tag('jeans.png', size: '50x50'),
          image_tag('black_shoes.png', size: '50x50')
        ]
        suggestion = '程よい気温,カーディガンなど薄手のものがちょうどいいかも'
      elsif temperature >= 19 && temperature < 23
        icon_tags = [
          image_tag('parker.png', size: '50x50'),
          image_tag('Y-shirts.png', size: '50x50'),
          image_tag('black_pants.png', size: '50x50'),
          image_tag('white_shoes.png', size: '50x50')
        ]
        suggestion = '昼間の気温は快適,一応薄手のカーディガンやパーカーがあるといいかも'
      elsif temperature >= 23 && temperature < 27
        icon_tags = [
          image_tag('cloth_longt.png', size: '50x50'),
          image_tag('black_pants.png', size: '50x50'),
          image_tag('white_shoes.png', size: '50x50')
        ]
        suggestion = 'じんわり暑い,薄手の長袖がちょうどいいんじゃ'
      elsif temperature >= 27 && temperature < 32
        icon_tags = [
          image_tag('fashion_tshirt1_white.png', size: '50x50'),
          image_tag('black_pants.png', size: '50x50'),
          image_tag('white_shoes.png', size: '50x50')
        ]
        suggestion = 'とても暑い,半袖で十分'
      else
        suggestion = '危険な暑さ,ノースリーブや短パンでも暑いから,熱中症に気をつけて！!'
        icon_tags = [
          image_tag('hat_kankan', size: '50x50'),
          image_tag('fashion_tshirt1_white.png', size: '50x50'),
          image_tag('half_pants.png', size: '50x50'),
          image_tag('shoes_side06_beach.png', size: '50x50'),
          image_tag('pool_bath_towel.png', size: '50x50')
        ]
      end

    when 3 # 標準
      if temperature < 5
        icon_tags = [
          image_tag('knitcap.png', size: '50x50'),
          image_tag('down.png', size: '50x50'),
          image_tag('muffler.png', size: '50x50'),
          image_tag('cardigan.png', size: '50x50'),
          image_tag('Y-shirts.png', size: '50x50'),
          image_tag('tebukuro.png', size: '50x50'),
          image_tag('hokkairo.png', size: '50x50'),
          image_tag('jeans.png', size: '50x50'),
          image_tag('black_shoes.png', size: '50x50')
        ]
        suggestion = '厳しい寒さ,ダウンジャケットは必須！！'
      elsif temperature >= 5 && temperature < 9
        icon_tags = [
          image_tag('down.png', size: '50x50'),
          image_tag('muffler.png', size: '50x50'),
          image_tag('cardigan.png', size: '50x50'),
          image_tag('Y-shirts.png', size: '50x50'),
          image_tag('tebukuro.png', size: '50x50'),
          image_tag('jeans.png', size: '50x50'),
          image_tag('black_shoes.png', size: '50x50')
        ]
        suggestion = 'とても寒い,今日はマフラー手袋などで寒さ対策必要'
      elsif temperature >= 9 && temperature < 13
        icon_tags = [
          image_tag('chester_coat.png', size: '50x50'),
          image_tag('muffler.png', size: '50x50'),
          image_tag('cardigan.png', size: '50x50'),
          image_tag('Y-shirts.png', size: '50x50'),
          image_tag('tebukuro.png', size: '50x50'),
          image_tag('jeans.png', size: '50x50'),
          image_tag('black_shoes.png', size: '50x50')
        ]
        suggestion = '寒い,コートを着ないと結構寒いわ'
      elsif temperature >= 13 && temperature < 17
        icon_tags = [
          image_tag('flight_jacket.png', size: '50x50'),
          image_tag('cardigan.png', size: '50x50'),
          image_tag('Y-shirts.png', size: '50x50'),
          image_tag('jeans.png', size: '50x50'),
          image_tag('black_shoes.png', size: '50x50')
        ]
        suggestion = 'じんわり冷える寒さ,薄手のアウターがちょうどいいかも'
      elsif temperature >= 17 && temperature < 20
        icon_tags = [
          image_tag('cardigan.png', size: '50x50'),
          image_tag('Y-shirts.png', size: '50x50'),
          image_tag('jeans.png', size: '50x50'),
          image_tag('black_shoes.png', size: '50x50')
        ]
        suggestion = '程よい気温,カーディガンなど薄手のものがちょうどいいかも'
      elsif temperature >= 20 && temperature < 24
        icon_tags = [
          image_tag('parker.png', size: '50x50'),
          image_tag('Y-shirts.png', size: '50x50'),
          image_tag('black_pants.png', size: '50x50'),
          image_tag('white_shoes.png', size: '50x50')
        ]
        suggestion = '昼間の気温は快適,一応薄手のカーディガンやパーカーがあるといいかも'
      elsif temperature >= 24 && temperature < 28
        icon_tags = [
          image_tag('cloth_longt.png', size: '50x50'),
          image_tag('black_pants.png', size: '50x50'),
          image_tag('white_shoes.png', size: '50x50')
        ]
        suggestion = 'じんわり暑い,薄手の長袖がちょうどいいんじゃ'
      elsif temperature >= 28 && temperature < 33
        icon_tags = [
          image_tag('fashion_tshirt1_white.png', size: '50x50'),
          image_tag('black_pants.png', size: '50x50'),
          image_tag('white_shoes.png', size: '50x50')
        ]
        suggestion = 'とても暑い,半袖で十分'
      else
        suggestion = '危険な暑さ,ノースリーブや短パンでも暑いから,熱中症に気をつけて！!'
        icon_tags = [
          image_tag('hat_kankan', size: '50x50'),
          image_tag('fashion_tshirt1_white.png', size: '50x50'),
          image_tag('half_pants.png', size: '50x50'),
          image_tag('shoes_side06_beach.png', size: '50x50'),
          image_tag('pool_bath_towel.png', size: '50x50')
        ]
      end

    when 4 # やや寒がり
      if temperature < 6
        icon_tags = [
          image_tag('knitcap.png', size: '50x50'),
          image_tag('down.png', size: '50x50'),
          image_tag('muffler.png', size: '50x50'),
          image_tag('cardigan.png', size: '50x50'),
          image_tag('Y-shirts.png', size: '50x50'),
          image_tag('tebukuro.png', size: '50x50'),
          image_tag('hokkairo.png', size: '50x50'),
          image_tag('jeans.png', size: '50x50'),
          image_tag('black_shoes.png', size: '50x50')
        ]
        suggestion = '厳しい寒さ,ダウンジャケットは必須！！'
      elsif temperature >= 6 && temperature < 10
        icon_tags = [
          image_tag('down.png', size: '50x50'),
          image_tag('muffler.png', size: '50x50'),
          image_tag('cardigan.png', size: '50x50'),
          image_tag('Y-shirts.png', size: '50x50'),
          image_tag('tebukuro.png', size: '50x50'),
          image_tag('jeans.png', size: '50x50'),
          image_tag('black_shoes.png', size: '50x50')
        ]
        suggestion = 'とても寒い,今日はマフラー手袋などで寒さ対策必要'
      elsif temperature >= 10 && temperature < 14
        icon_tags = [
          image_tag('chester_coat.png', size: '50x50'),
          image_tag('muffler.png', size: '50x50'),
          image_tag('cardigan.png', size: '50x50'),
          image_tag('Y-shirts.png', size: '50x50'),
          image_tag('tebukuro.png', size: '50x50'),
          image_tag('jeans.png', size: '50x50'),
          image_tag('black_shoes.png', size: '50x50')
        ]
        suggestion = '寒い,コートを着ないと結構寒いわ'
      elsif temperature >= 14 && temperature < 18
        icon_tags = [
          image_tag('flight_jacket.png', size: '50x50'),
          image_tag('cardigan.png', size: '50x50'),
          image_tag('Y-shirts.png', size: '50x50'),
          image_tag('jeans.png', size: '50x50'),
          image_tag('black_shoes.png', size: '50x50')
        ]
        suggestion = 'じんわり冷える寒さ,薄手のアウターがちょうどいいかも'
      elsif temperature >= 18 && temperature < 21
        icon_tags = [
          image_tag('cardigan.png', size: '50x50'),
          image_tag('Y-shirts.png', size: '50x50'),
          image_tag('jeans.png', size: '50x50'),
          image_tag('black_shoes.png', size: '50x50')
        ]
        suggestion = '程よい気温,カーディガンなど薄手のものがちょうどいいかも'
      elsif temperature >= 21 && temperature < 25
        icon_tags = [
          image_tag('parker.png', size: '50x50'),
          image_tag('Y-shirts.png', size: '50x50'),
          image_tag('black_pants.png', size: '50x50'),
          image_tag('white_shoes.png', size: '50x50')
        ]
        suggestion = '昼間の気温は快適,一応薄手のカーディガンやパーカーがあるといいかも'
      elsif temperature >= 25 && temperature < 29
        icon_tags = [
          image_tag('cloth_longt.png', size: '50x50'),
          image_tag('black_pants.png', size: '50x50'),
          image_tag('white_shoes.png', size: '50x50')
        ]
        suggestion = 'じんわり暑い,薄手の長袖がちょうどいいんじゃ'
      elsif temperature >= 29 && temperature < 34
        icon_tags = [
          image_tag('fashion_tshirt1_white.png', size: '50x50'),
          image_tag('black_pants.png', size: '50x50'),
          image_tag('white_shoes.png', size: '50x50')
        ]
        suggestion = 'とても暑い,半袖で十分'
      else
        suggestion = '危険な暑さ,ノースリーブや短パンでも暑いから,熱中症に気をつけて！!'
        icon_tags = [
          image_tag('hat_kankan', size: '50x50'),
          image_tag('fashion_tshirt1_white.png', size: '50x50'),
          image_tag('half_pants.png', size: '50x50'),
          image_tag('shoes_side06_beach.png', size: '50x50'),
          image_tag('pool_bath_towel.png', size: '50x50')
        ]
      end

    when 5 # 寒がり
      if temperature < 7
        icon_tags = [
          image_tag('knitcap.png', size: '50x50'),
          image_tag('down.png', size: '50x50'),
          image_tag('muffler.png', size: '50x50'),
          image_tag('cardigan.png', size: '50x50'),
          image_tag('Y-shirts.png', size: '50x50'),
          image_tag('tebukuro.png', size: '50x50'),
          image_tag('hokkairo.png', size: '50x50'),
          image_tag('jeans.png', size: '50x50'),
          image_tag('black_shoes.png', size: '50x50')
        ]
        suggestion = '厳しい寒さ,ダウンジャケットは必須！！'
      elsif temperature >= 8 && temperature < 11
        icon_tags = [
          image_tag('down.png', size: '50x50'),
          image_tag('muffler.png', size: '50x50'),
          image_tag('cardigan.png', size: '50x50'),
          image_tag('Y-shirts.png', size: '50x50'),
          image_tag('tebukuro.png', size: '50x50'),
          image_tag('jeans.png', size: '50x50'),
          image_tag('black_shoes.png', size: '50x50')
        ]
        suggestion = 'とても寒い,今日はマフラー手袋などで寒さ対策必要'
      elsif temperature >= 11 && temperature < 15
        icon_tags = [
          image_tag('chester_coat.png', size: '50x50'),
          image_tag('muffler.png', size: '50x50'),
          image_tag('cardigan.png', size: '50x50'),
          image_tag('Y-shirts.png', size: '50x50'),
          image_tag('tebukuro.png', size: '50x50'),
          image_tag('jeans.png', size: '50x50'),
          image_tag('black_shoes.png', size: '50x50')
        ]
        suggestion = '寒い,コートを着ないと結構寒いわ'
      elsif temperature >= 15 && temperature < 19
        icon_tags = [
          image_tag('flight_jacket.png', size: '50x50'),
          image_tag('cardigan.png', size: '50x50'),
          image_tag('Y-shirts.png', size: '50x50'),
          image_tag('jeans.png', size: '50x50'),
          image_tag('black_shoes.png', size: '50x50')
        ]
        suggestion = 'じんわり冷える寒さ,薄手のアウターがちょうどいいかも'
      elsif temperature >= 19 && temperature < 22
        icon_tags = [
          image_tag('cardigan.png', size: '50x50'),
          image_tag('Y-shirts.png', size: '50x50'),
          image_tag('jeans.png', size: '50x50'),
          image_tag('black_shoes.png', size: '50x50')
        ]
        suggestion = '程よい気温,カーディガンなど薄手のものがちょうどいいかも'
      elsif temperature >= 22 && temperature < 26
        icon_tags = [
          image_tag('parker.png', size: '50x50'),
          image_tag('Y-shirts.png', size: '50x50'),
          image_tag('black_pants.png', size: '50x50'),
          image_tag('white_shoes.png', size: '50x50')
        ]
        suggestion = '昼間の気温は快適,一応薄手のカーディガンやパーカーがあるといいかも'
      elsif temperature >= 26 && temperature < 30
        icon_tags = [
          image_tag('cloth_longt.png', size: '50x50'),
          image_tag('black_pants.png', size: '50x50'),
          image_tag('white_shoes.png', size: '50x50')
        ]
        suggestion = 'じんわり暑い,薄手の長袖がちょうどいいんじゃ'
      elsif temperature >= 30 && temperature < 35
        icon_tags = [
          image_tag('fashion_tshirt1_white.png', size: '50x50'),
          image_tag('black_pants.png', size: '50x50'),
          image_tag('white_shoes.png', size: '50x50')
        ]
        suggestion = 'とても暑い,半袖で十分'
      else
        suggestion = '危険な暑さ,ノースリーブや短パンでも暑いから,熱中症に気をつけて！!'
        icon_tags = [
          image_tag('hat_kankan', size: '50x50'),
          image_tag('fashion_tshirt1_white.png', size: '50x50'),
          image_tag('half_pants.png', size: '50x50'),
          image_tag('shoes_side06_beach.png', size: '50x50'),
          image_tag('pool_bath_towel.png', size: '50x50')
        ]
      end
    else
      suggestion = '**新規登録またはログインを行い,体質設定を行なってください**'
    end

    return "#{icon_tags.join(' ')} #{suggestion}".html_safe unless icon_tags.empty?

    suggestion
  end

  def display_clothes_photo(temperature, constitution_id, user)
    subcategory_ids = get_subcategory_ids(temperature, constitution_id)

    subcategory_ids.uniq.map do |subcategory_id|
      # 最後に使用された日が最も古いアイテムを選択
      closet_item = user.closets
                        .where(subcategory_id:)
                        .order(:last_worn_on)
                        .first

      # アイテムの最後に使用された日を今日に更新
      closet_item.update(last_worn_on: Time.zone.today) if closet_item.present?

      closet_item&.image_url
    end.compact
  end

  private

  def get_subcategory_ids(temperature, constitution_id)
    case constitution_id
    when 1 # 暑がり
      case temperature
      when ...3 then [18, 7, 2, 10, 6]
      when 3...7 then [17, 7, 2, 10, 29]
      when 7...11 then [17, 6, 8, 11, 35]
      when 11...15 then [17, 6, 2, 29, 11]
      when 15...18 then [7, 1, 10, 29]
      when 18...22 then [20, 1, 10, 29]
      when 22... then [1, 11, 29]
      end

    when 2 # やや暑がり
      case temperature
      when ...4 then [18, 7, 2, 10, 6]
      when 4...8 then [18, 7, 2, 10, 29]
      when 8...12 then [17, 6, 8, 11, 35]
      when 12...16 then [17, 6, 2, 29, 11]
      when 16...19 then [7, 1, 10, 29]
      when 19...23 then [20, 1, 10, 29]
      when 23... then [1, 11, 29]
      end

    when 3 # 標準
      case temperature
      when ...5 then [18, 7, 2, 10, 6]
      when 5...9 then [18, 7, 2, 10, 29]
      when 9...13 then [17, 6, 8, 11, 35]
      when 13...17 then [17, 6, 2, 29, 11]
      when 17...20 then [7, 1, 10, 29]
      when 20...24 then [20, 1, 10, 29]
      when 24... then [1, 11, 29]
      end

    when 4 # やや寒がり
      case temperature
      when ...6 then [18, 7, 2, 10, 6]
      when 6...10 then [18, 7, 2, 10, 29]
      when 10...14 then [17, 6, 8, 11, 35]
      when 14...18 then [17, 6, 2, 29, 11]
      when 18...21 then [7, 1, 10, 29]
      when 21...25 then [20, 10, 29]
      when 25... then [1, 11, 29]
      end

    when 5 # 寒がり
      case temperature
      when ...7 then [18, 7, 2, 10, 6]
      when 7...11 then [18, 7, 2, 10, 29]
      when 11...15 then [17, 6, 8, 11, 35]
      when 15...19 then [17, 6, 2, 29, 11]
      when 19...22 then [7, 1, 10, 29]
      when 22...26 then [20, ß1, 10, 29]
      when 26... then [1, 11, 29]
      end

    else
      []
    end
  end
end
