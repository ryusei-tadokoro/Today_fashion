# frozen_string_literal: true

categories_data = [
  { name: 'トップス' }, { name: 'ボトムス' }, { name: 'アウター' },
  { name: 'セットアップ' }, { name: 'ワンピース・サロペット' }, { name: 'シューズ' },
  { name: 'バッグ' }, { name: 'アクセサリー' }, { name: 'その他' }, { name: '指定しない' }
]

categories_data.each do |category_data|
  Category.find_or_create_by(category_data)
end

subcategories_data = [
  { name: 'Tシャツ', category_id: 1 },
  { name: 'シャツ', category_id: 1 },
  { name: 'ポロシャツ', category_id: 1 },
  { name: 'スウェット', category_id: 1 },
  { name: 'パーカー', category_id: 1 },
  { name: 'ニット', category_id: 1 },
  { name: 'カーディガン', category_id: 1 },
  { name: 'インナー', category_id: 1 },
  { name: 'その他', category_id: 1 },
  { name: 'ジーンズ', category_id: 2 },
  { name: 'チノパンツ', category_id: 2 },
  { name: 'ショートパンツ', category_id: 2 },
  { name: 'スカート', category_id: 2 },
  { name: 'レギンス', category_id: 2 },
  { name: 'その他', category_id: 2 },
  { name: 'ジャケット', category_id: 3 },
  { name: 'コート', category_id: 3 },
  { name: 'ダウンジャケット', category_id: 3 },
  { name: 'ブルゾン', category_id: 3 },
  { name: 'パーカー', category_id: 3 },
  { name: 'その他', category_id: 3 },
  { name: 'パンツスーツ', category_id: 4 },
  { name: 'スカートスーツ', category_id: 4 },
  { name: 'ツーピースセット', category_id: 4 },
  { name: 'その他', category_id: 4 },
  { name: 'ワンピース', category_id: 5 },
  { name: 'サロペット', category_id: 5 },
  { name: 'その他', category_id: 5 },
  { name: 'スニーカー', category_id: 6 },
  { name: 'ブーツ', category_id: 6 },
  { name: 'サンダル', category_id: 6 },
  { name: 'パンプス', category_id: 6 },
  { name: 'フラットシューズ', category_id: 6 },
  { name: 'ヒールシューズ', category_id: 6 },
  { name: 'その他', category_id: 6 },
  { name: 'トートバッグ', category_id: 7 },
  { name: 'ショルダーバッグ', category_id: 7 },
  { name: 'ハンドバッグ', category_id: 7 },
  { name: 'バックパック', category_id: 7 },
  { name: 'クラッチバッグ', category_id: 7 },
  { name: 'ウエストポーチ', category_id: 7 },
  { name: 'ビジネスバッグ', category_id: 7 },
  { name: 'トラベルバッグ', category_id: 7 },
  { name: 'その他', category_id: 7 },
  { name: 'ネックレス', category_id: 8 },
  { name: 'ブレスレット', category_id: 8 },
  { name: 'リング', category_id: 8 },
  { name: 'ピアス', category_id: 8 },
  { name: 'イヤリング', category_id: 8 },
  { name: 'ヘアアクセサリー', category_id: 8 },
  { name: '時計', category_id: 8 },
  { name: 'サングラス・メガネ', category_id: 8 },
  { name: 'ハット', category_id: 8 },
  { name: 'その他', category_id: 8 },
  { name: 'ルームウェア', category_id: 9 },
  { name: 'アンダーウェア', category_id: 9 },
  { name: '着物・浴衣', category_id: 9 },
  { name: 'スポーツウェア', category_id: 9 },
  { name: 'イベント・衣装', category_id: 9 },
  { name: 'その他', category_id: 9 },
  { name: '指定しない', category_id: 10 }
]

subcategories_data.each do |subcategory_data|
  Subcategory.find_or_create_by(subcategory_data)
end

TodayMessage.create(content: '今日も元気に過ごしましょう。')
TodayMessage.create(content: '今日はいい日になりそうですね。')
TodayMessage.create(content: '素敵な出会いがありますように。')
