class SavedVideo < ApplicationRecord
  belongs_to :user
  has_many :video_folders, dependent: :destroy
  has_many :folders, through: :video_folders
end
