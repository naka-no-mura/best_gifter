class Item < ApplicationRecord
  belongs_to :user

  validates :item_code, uniqueness: true
end
