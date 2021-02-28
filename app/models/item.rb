class Item < ApplicationRecord
  belongs_to :user

  validates :name, uniqueness: true
  validates :price, uniqueness: true
  validates :url, uniqueness: true
  validates :review_count, uniqueness: true
  validates :review_average, uniqueness: true
  validates :genre_id, uniqueness: true
end
