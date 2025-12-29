class VideoFolder < ApplicationRecord
  belongs_to :saved_video
  belongs_to :folder
end
