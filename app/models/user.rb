class User < ApplicationRecord
  has_one_attached :avatar
  has_many :saved_videos, dependent: :destroy
  has_many :folders, dependent: :destroy

  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, length: { maximum: 30 }, allow_blank: true


end
