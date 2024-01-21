class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: 'トップス' }, { id: 2, name: 'ボトムス' }, { id: 3, name: 'アウター' },
    { id: 4, name: 'セットアップ' }, { id: 5, name: 'ワンピース・サロペット' }, { id: 6, name: 'シューズ' },
    { id: 7, name: 'バッグ' }, { id: 8, name: 'アクセサリー' }, { id: 9, name: 'その他' }
  ]
  include ActiveHash::Associations
  has_many :closets
  has_many :subcategories
end