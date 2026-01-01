class Folder < ApplicationRecord
  belongs_to :user
  has_many :video_folders, dependent: :destroy
  has_many :saved_videos, through: :video_folders
  has_one_attached :image

  validates :name, presence: true
  validates :name, uniqueness: { scope: :user_id, message: "はすでに存在します" } # 同じユーザー内で同名フォルダを禁止（他ユーザーならOK）

end
