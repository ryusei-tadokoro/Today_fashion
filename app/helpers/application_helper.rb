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
    return suggestion
  end


  def display_clothes_photo(temperature, constitution_id, user)
    subcategory_ids = get_subcategory_ids(temperature, constitution_id)
    
    image_urls = subcategory_ids.uniq.map do |subcategory_id|
      closet = user.closets.find_by(subcategory_id: subcategory_id)
      closet&.image_url
    end.compact

    image_urls
  end

  private
  
  def get_subcategory_ids(temperature, constitution_id)
      case constitution_id
      when 1 # 暑がり
        if temperature < 3
          [18, 7, 2, 10, 6] 
        elsif temperature >= 3 && temperature < 7
          [17, 7, 2, 10, 29]
        elsif temperature >= 7 && temperature < 11
          [17, 6, 8, 11, 35] 
        elsif temperature >= 11 && temperature < 15
          [17, 6, 2, 29, 11] 
        elsif temperature >= 15 && temperature < 18
          [7, 1, 10, 29]
        elsif temperature >= 18 && temperature < 22
          [20, 10, 29]
        elsif temperature >= 22 && temperature < 26
          [1, 11, 29]
        elsif temperature >= 26
          [1, 11, 29]
        end

      when 2 # やや暑がり
        if temperature < 4
          [18, 7, 2, 10, 6]
        elsif temperature >= 4 && temperature < 8
          [18, 7, 2, 10, 29]
        elsif temperature >= 8 && temperature < 12
          [17, 6, 8, 11, 35] 
        elsif temperature >= 12 && temperature < 16
          [17, 6, 2, 29, 11] 
        elsif temperature >= 16 && temperature < 19
          [7, 1, 10, 29]
        elsif temperature >= 19 && temperature < 23
          [20, 10, 29]
        elsif temperature >= 23 && temperature < 27
          [1, 11, 29]
        elsif temperature >= 27
          [1, 11, 29]
        end

      when 3 # 標準
        if temperature < 5
          [18, 7, 2, 10, 6]
        elsif temperature >= 5 && temperature < 9
          [18, 7, 2, 10, 29]
        elsif temperature >= 9 && temperature < 13
          [17, 6, 8, 11, 35] 
        elsif temperature >= 13 && temperature < 17
          [17, 6, 2, 29, 11] 
        elsif temperature >= 17 && temperature < 20
          [7, 1, 10, 29]
        elsif temperature >= 20 && temperature < 24
          [20, 10, 29]
        elsif temperature >= 24 && temperature < 28
          [1, 11, 29]
        elsif temperature >= 28
          [1, 11, 29]
        end

      when 4 # やや寒がり
        if temperature < 6
          [18, 7, 2, 10, 6]
        elsif temperature >= 6 && temperature < 10
          [18, 7, 2, 10, 29]
        elsif temperature >= 10 && temperature < 14
          [17, 6, 8, 11, 35] 
        elsif temperature >= 14 && temperature < 18
          [17, 6, 2, 29, 11] 
        elsif temperature >= 18 && temperature < 21
          [7, 1, 10, 29]
        elsif temperature >= 21 && temperature < 25
          [20, 10, 29]
        elsif temperature >= 25 && temperature < 29
          [1, 11, 29]
        elsif temperature >= 29
          [1, 11, 29]
        end

      when 5 # 寒がり
        if temperature < 7
          [18, 7, 2, 10, 6]
        elsif temperature >= 7 && temperature < 11
          [18, 7, 2, 10, 29]
        elsif temperature >= 11 && temperature < 15
          [17, 6, 8, 11, 35] 
        elsif temperature >= 15 && temperature < 19
          [17, 6, 2, 29, 11] 
        elsif temperature >= 19 && temperature < 22
          [7, 1, 10, 29]
        elsif temperature >= 22 && temperature < 26
          [20, 10, 29]
        elsif temperature >= 26 && temperature < 30
          [1, 11, 29]
        elsif temperature >= 30
          [1, 11, 29]
        end
      else
        []
      end
  end
end
