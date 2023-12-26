class Sensation < ApplicationRecord
    has_many :users
    enum sensation_id:{
        '選択してください':0,
        暑がり:1,やや暑がり:2,普通:3,やや寒がり:4,寒がり:5,
    }

    validates :sensation_id, presence: true, numericality: { greater_than: 0, message: "を選択してください" }
end
