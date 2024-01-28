module ApplicationHelper
  def kelvin_to_celsius(kelvin)
    kelvin - 273.15
  end

  def dress_code_suggestion(temperature, constitution_id)
    case constitution_id
    when 1 # 暑がり
        if temperature < 3
            '厳しい寒さ,ダウンジャケットは必須！！'
        elsif temperature >= 3 && temperature < 7
            'とても寒い,今日はマフラー手袋などで寒さ対策必要'
        elsif temperature >= 7 && temperature < 11
            '寒い,コートを着ないと結構寒いわ'
        elsif temperature >= 11 && temperature < 15
            'じんわり冷える寒さ,薄手のアウターがちょうどいいかも'
        elsif temperature >= 15 && temperature < 18
            '程よい気温,カーディガンなど薄手のものがちょうどいいかも'
        elsif temperature >= 18 && temperature < 22
            '昼間の気温は快適,一応薄手のカーディガンやパーカーがあるといいかも'
        elsif temperature >= 22 && temperature < 26
            'じんわり暑い,薄手の長袖がちょうどいいんじゃ'
        elsif temperature >= 26 && temperature < 31
            'とても暑い,半袖で十分'
        else
            '危険な暑さ,ノースリーブや短パンでも暑いから,熱中症に気をつけて！!'
        end
    when 2 # やや暑がり
        if temperature < 4
          '厳しい寒さ,ダウンジャケットは必須！！'
        elsif temperature >= 4 && temperature < 8
          'とても寒い,今日はマフラー手袋などで寒さ対策が必要'
        elsif temperature >= 8 && temperature < 12
          '寒い,コートを着ないと結構寒いわ'
        elsif temperature >= 12 && temperature < 16
          'じんわり冷える寒さ,薄手のアウターがちょうどいいかも'
        elsif temperature >= 16 && temperature < 19
          '程よい気温,カーディガンなど薄手のものがちょうどいいかも'
        elsif temperature >= 19 && temperature < 23
          '昼間の気温は快適,一応薄手のカーディガンやパーカーがあるといいかも'
        elsif temperature >= 23 && temperature < 27
          'じんわり暑い,薄手の長袖がちょうどいいんじゃ'
        elsif temperature >= 27 && temperature < 32
          'とても暑い,半袖で十分'
        else
          '危険な暑さ,ノースリーブや短パンでも暑いから,熱中症に気をつけて！!'
        end      
    when 3 # 標準
        if temperature < 5
            '厳しい寒さ,ダウンジャケットは必須！！'
        elsif temperature >= 5 && temperature < 9
            'とても寒い,今日はマフラー手袋などで寒さ対策必要'
        elsif temperature >= 9 && temperature < 13
            '寒い,コートを着ないと結構寒いわ'
        elsif temperature >= 13 && temperature < 17
            'じんわり冷える寒さ,薄手のアウターがちょうどいいかも'
        elsif temperature >= 17 && temperature < 20
            '程よい気温,カーディガンなど薄手のものがちょうどいいかも'
        elsif temperature >= 20 && temperature < 24
            '昼間の気温は快適,一応薄手のカーディガンやパーカーがあるといいかも'
        elsif temperature >= 24 && temperature < 28
            'じんわり暑い,薄手の長袖がちょうどいいんじゃ'
        elsif temperature >= 28 && temperature < 33
            'とても暑い,半袖で十分'
        else
            '危険な暑さ,ノースリーブや短パンでも暑いから,熱中症に気をつけて！!'
        end
    when 4 # やや寒がり
        if temperature < 6
          '厳しい寒さ,ダウンジャケットは必須！！'
        elsif temperature >= 6 && temperature < 10
          'とても寒い,今日はマフラー手袋などで寒さ対策が必要'
        elsif temperature >= 10 && temperature < 14
          '寒い,コートを着ないと結構寒いわ'
        elsif temperature >= 14 && temperature < 18
          'じんわり冷える寒さ,薄手のアウターがちょうどいいかも'
        elsif temperature >= 18 && temperature < 21
          '程よい気温,カーディガンなど薄手のものがちょうどいいかも'
        elsif temperature >= 21 && temperature < 25
          '昼間の気温は快適,一応薄手のカーディガンやパーカーがあるといいかも'
        elsif temperature >= 25 && temperature < 29
          'じんわり暑い,薄手の長袖がちょうどいいんじゃ'
        elsif temperature >= 29 && temperature < 34
          'とても暑い,半袖で十分'
        else
          '危険な暑さ,ノースリーブや短パンでも暑いから,熱中症に気をつけて！!'
        end
      
    when 5 # 寒がり
        if temperature < 7
          '厳しい寒さ,ダウンジャケットは必須！！'
        elsif temperature >= 7 && temperature < 11
          'とても寒い,今日はマフラー手袋などで寒さ対策が必要'
        elsif temperature >= 11 && temperature < 15
          '寒い,コートを着ないと結構寒いわ'
        elsif temperature >= 15 && temperature < 18
          'じんわり冷える寒さ,薄手のアウターがちょうどいいかも'
        elsif temperature >= 18 && temperature < 21
          '程よい気温,カーディガンなど薄手のものがちょうどいいかも'
        elsif temperature >= 21 && temperature < 25
          '昼間の気温は快適,一応薄手のカーディガンやパーカーがあるといいかも'
        elsif temperature >= 25 && temperature < 30
          'じんわり暑い,薄手の長袖がちょうどいいんじゃ'
        elsif temperature >= 30 && temperature < 35
          'とても暑い,半袖で十分'
        else
          '危険な暑さ,ノースリーブや短パンでも暑いから,熱中症に気をつけて！!'
        end
      
    else
      '体質に合わせた服装の提案ができません。'
    end
  end  
end
