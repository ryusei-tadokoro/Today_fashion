class Subcategory < ActiveHash::Base
  self.data = [
    # トップス
    { id: 1, name: 'Tシャツ', category_id: 1 },
    { id: 2, name: 'シャツ', category_id: 1 },
    { id: 3, name: 'ポロシャツ', category_id: 1 },
    { id: 4, name: 'スウェット', category_id: 1 },
    { id: 5, name: 'パーカー', category_id: 1 },
    { id: 6, name: 'ニット', category_id: 1 },
    { id: 7, name: 'インナー', category_id: 1 },
    { id: 8, name: 'その他', category_id: 1 },
    # ボトムス
    { id: 9, name: 'ジーンズ', category_id: 2 },
    { id: 10, name: 'チノパンツ', category_id: 2 },
    { id: 11, name: 'ショートパンツ', category_id: 2 },
    { id: 12, name: 'スカート', category_id: 2 },
    { id: 13, name: 'レギンス', category_id: 2 },
    { id: 14, name: 'その他', category_id: 2 },
    # アウター
    { id: 15, name: 'ジャケット', category_id: 3 },
    { id: 16, name: 'コート', category_id: 3 },
    { id: 17, name: 'ダウンジャケット', category_id: 3 },
    { id: 18, name: 'ブルゾン', category_id: 3 },
    { id: 19, name: 'パーカー', category_id: 3 },
    { id: 20, name: 'その他', category_id: 3 },
    # セットアップ
    { id: 21, name: 'パンツスーツ', category_id: 4 },
    { id: 22, name: 'スカートスーツ', category_id: 4 },
    { id: 23, name: 'ツーピースセット', category_id: 4 },
    { id: 24, name: 'その他', category_id: 4 },
    # ワンピース、サロペット
    { id: 25, name: 'ワンピース', category_id: 5 },
    { id: 26, name: 'サロペット', category_id: 5 },
    { id: 27, name: 'その他', category_id: 5 },
    # シューズ
    { id: 28, name: 'スニーカー', category_id: 6 },
    { id: 29, name: 'ブーツ', category_id: 6 },
    { id: 30, name: 'サンダル', category_id: 6 },
    { id: 31, name: 'パンプス', category_id: 6 },
    { id: 32, name: 'フラットシューズ', category_id: 6 },
    { id: 33, name: 'ヒールシューズ', category_id: 6 },
    { id: 34, name: 'その他', category_id: 6 },
    # バッグ
    { id: 35, name: 'トートバッグ', category_id: 7 },
    { id: 36, name: 'ショルダーバッグ', category_id: 7 },
    { id: 37, name: 'ハンドバッグ', category_id: 7 },
    { id: 38, name: 'バックパック', category_id: 7 },
    { id: 39, name: 'クラッチバッグ', category_id: 7 },
    { id: 40, name: 'ウエストポーチ', category_id: 7 },
    { id: 41, name: 'ビジネスバッグ', category_id: 7 },
    { id: 42, name: 'トラベルバッグ', category_id: 7 },
    { id: 43, name: 'その他', category_id: 7 },
    # アクセサリー
    { id: 44, name: 'ネックレス', category_id: 8 },
    { id: 45, name: 'ブレスレット', category_id: 8 },
    { id: 46, name: 'リング', category_id: 8 },
    { id: 47, name: 'ピアス', category_id: 8 },
    { id: 48, name: 'イヤリング', category_id: 8 },
    { id: 49, name: 'ヘアアクセサリー', category_id: 8 },
    { id: 50, name: '時計', category_id: 8 },
    { id: 51, name: 'サングラス・メガネ', category_id: 8 },
    { id: 52, name: 'ハット', category_id: 8 },
    { id: 53, name: 'その他', category_id: 8 },
    # その他
    { id: 54, name: 'ルームウェア', category_id: 9 },
    { id: 55, name: 'アンダーウェア', category_id: 9 },
    { id: 56, name: '着物・浴衣', category_id: 9 },
    { id: 57, name: 'スポーツウェア', category_id: 9 },
    { id: 58, name: 'イベント・衣装', category_id: 9 },
    { id: 59, name: 'その他', category_id: 9 }
  ]
  include ActiveHash::Associations
  belongs_to :category
end