class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
    
  belongs_to :residence
  belongs_to :additional_residence, class_name: 'Residence'
  belongs_to :sensation

  validates :residence_id, presence: true
  validates :additional_residence_id, presence: true
  validates :sensation_id, presence: true
end
