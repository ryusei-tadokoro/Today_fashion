class Constitution < ActiveHash::Base
  self.data = [
    { id: 1, name: '暑がり' }, { id: 2, name: 'やや暑がり' }, { id: 3, name: '標準' },
    { id: 4, name: 'やや寒がり' }, { id: 5, name: '寒がり' }
  ]

  include ActiveHash::Associations
  has_many :users
end
