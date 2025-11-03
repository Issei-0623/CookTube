class Folder < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :name, uniqueness: { scope: :user_id, message: "はすでに存在します" } # 同じユーザー内で同名フォルダを禁止（他ユーザーならOK）

end
