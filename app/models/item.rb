class Item < ApplicationRecord
  belongs_to :user
  validates :user_id, uniqueness: { scope: :item_code, case_sensitive: false }
end
