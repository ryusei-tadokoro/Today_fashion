categories_data = [
  { name: 'トップス' }, { name: 'ボトムス' }, { name: 'アウター' },
  { name: 'セットアップ' }, { name: 'ワンピース・サロペット' }, { name: 'シューズ' },
  { name: 'バッグ' }, { name: 'アクセサリー' }, { name: 'その他' }
]

categories_data.each do |category_data|
  Category.find_or_create_by(category_data)
end


subcategories_data = [
  { name: 'Tシャツ', category_id: 1, temperature_range: (25..100) },
  { name: 'シャツ', category_id: 1, temperature_range: (-10..30) },
  { name: 'ポロシャツ', category_id: 1, temperature_range: (18..28) },
  { name: 'スウェット', category_id: 1, temperature_range: (-10..25) },
  { name: 'パーカー', category_id: 1, temperature_range: (-15..25) },
  { name: 'ニット', category_id: 1, temperature_range: (-100..20) },
  { name: 'インナー', category_id: 1, temperature_range: (-100..15) },
  { name: 'その他', category_id: 1, temperature_range: (-100..100) },
  { name: 'ジーンズ', category_id: 2, temperature_range: (-5..30) },
  { name: 'チノパンツ', category_id: 2, temperature_range: (-5..35) },
  { name: 'ショートパンツ', category_id: 2, temperature_range: (28..50) },
  { name: 'スカート', category_id: 2, temperature_range: (0..40) },
  { name: 'レギンス', category_id: 2, temperature_range: (0..10) },
  { name: 'その他', category_id: 2, temperature_range: (-100..100) },
  { name: 'ジャケット', category_id: 3, temperature_range: (-5..25) },
  { name: 'コート', category_id: 3, temperature_range: (-10..10) },
  { name: 'ダウンジャケット', category_id: 3, temperature_range: (-20..12) },
  { name: 'ブルゾン', category_id: 3, temperature_range: (5..15) },
  { name: 'パーカー', category_id: 3, temperature_range: (-10..25) },
  { name: 'その他', category_id: 3, temperature_range: (-100..100) },
  { name: 'パンツスーツ', category_id: 4, temperature_range: (-10..0) },
  { name: 'スカートスーツ', category_id: 4, temperature_range: (-10..0) },
  { name: 'ツーピースセット', category_id: 4, temperature_range: (0..10) },
  { name: 'その他', category_id: 4, temperature_range: (-100..100) },
  { name: 'ワンピース', category_id: 5, temperature_range: (5..45) },
  { name: 'サロペット', category_id: 5, temperature_range: (10..20) },
  { name: 'その他', category_id: 5, temperature_range: (-100..100) },
  { name: 'スニーカー', category_id: 6, temperature_range: (-100..100) },
  { name: 'ブーツ', category_id: 6, temperature_range: (-5..25) },
  { name: 'サンダル', category_id: 6, temperature_range: (25..100) },
  { name: 'パンプス', category_id: 6, temperature_range: (0..100) },
  { name: 'フラットシューズ', category_id: 6, temperature_range: (0..30) },
  { name: 'ヒールシューズ', category_id: 6, temperature_range: (0..30) },
  { name: 'その他', category_id: 6, temperature_range: (-100..100) },
  { name: 'トートバッグ', category_id: 7, temperature_range: (-100..100) },
  { name: 'ショルダーバッグ', category_id: 7, temperature_range: (-100..100) },
  { name: 'ハンドバッグ', category_id: 7, temperature_range: (-100..100) },
  { name: 'バックパック', category_id: 7, temperature_range: (-100..100) },
  { name: 'クラッチバッグ', category_id: 7, temperature_range: (-100..100) },
  { name: 'ウエストポーチ', category_id: 7, temperature_range: (-100..100) },
  { name: 'ビジネスバッグ', category_id: 7, temperature_range: (-100..100)},
  { name: 'トラベルバッグ', category_id: 7, temperature_range: (-100..100) },
  { name: 'その他', category_id: 7, temperature_range: (-100..100) },
  { name: 'ネックレス', category_id: 8, temperature_range: (-100..100) },
  { name: 'ブレスレット', category_id: 8, temperature_range: (-100..100)},
  { name: 'リング', category_id: 8, temperature_range: (-100..100) },
  { name: 'ピアス', category_id: 8, temperature_range: (-100..100) },
  { name: 'イヤリング', category_id: 8, temperature_range: (-100..100) },
  { name: 'ヘアアクセサリー', category_id: 8, temperature_range: (-100..100) },
  { name: '時計', category_id: 8, temperature_range: (-100..100) },
  { name: 'サングラス・メガネ', category_id: 8, temperature_range: (-100..100) },
  { name: 'ハット', category_id: 8, temperature_range: (-100..100) },
  { name: 'その他', category_id: 8, temperature_range: (-100..100) },
  { name: 'ルームウェア', category_id: 9, temperature_range: (-100..100) },
  { name: 'アンダーウェア', category_id: 9, temperature_range: (-100..100) },
  { name: '着物・浴衣', category_id: 9, temperature_range: (-100..100) },
  { name: 'スポーツウェア', category_id: 9, temperature_range: (-100..100) },
  { name: 'イベント・衣装', category_id: 9, temperature_range:(-100..100) },
  { name: 'その他', category_id: 9, temperature_range: (-100..100) },
]

subcategories_data.each do |subcategory_data|
  Subcategory.find_or_create_by(subcategory_data)
end

TodayMessage.create(content: '今日も元気に過ごしましょう。')
TodayMessage.create(content: '今日はいい日になりそうですね。')
TodayMessage.create(content: '素敵な出会いがありますように。')
