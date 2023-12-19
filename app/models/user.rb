class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
    
  belongs_to :residence, class_name: 'Residence'
  belongs_to :additional_residence, class_name: 'AdditionalResidence', optional: true

  validates :residence, presence: true
end
