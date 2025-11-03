class Folder < ApplicationRecord
  belongs_to :user
  has_many :saved_videos, dependent: :nullify #dependent: :nullify にすることで、フォルダを削除しても動画自体は残り、「未分類（folder_id=nil）」状態にできる

  validates :name, presence: true
  validates :name, uniqueness: { scope: :user_id, message: "はすでに存在します" } # 同じユーザー内で同名フォルダを禁止（他ユーザーならOK）

end
