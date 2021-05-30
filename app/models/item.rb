class Item < ApplicationRecord
  belongs_to :user
  validates :user_id, uniqueness: { scope: :item_code, case_sensitive: false }
  validates :name, presence: true
  validates :price, presence: true
  validates :url, presence: true
  validates :review_count, presence: true
  validates :review_average, presence: true
  validates :genre_id, presence: true
  validates :item_code, presence: true
end
