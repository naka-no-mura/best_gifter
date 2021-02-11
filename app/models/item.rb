class Item < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy

  validates :item_code, uniqueness: true
end
