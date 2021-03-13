class Item < ApplicationRecord
  belongs_to :user

  validates :name, uniqueness: { case_sensitive: false }
  validates :price, uniqueness: { case_sensitive: false }
  validates :url, uniqueness: { case_sensitive: false }
  validates :review_count, uniqueness: { case_sensitive: false }
  validates :review_average, uniqueness: { case_sensitive: false }
  validates :genre_id, uniqueness: { case_sensitive: false }
end
