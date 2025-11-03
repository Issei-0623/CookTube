class SavedVideo < ApplicationRecord
  belongs_to :user
  belongs_to :folder, optional: true

end
