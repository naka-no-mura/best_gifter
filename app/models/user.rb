class User < ApplicationRecord
  include JwtToken
  authenticates_with_sorcery!

  has_many :favorites, dependent: :destroy
  has_many :favorite_items, through: :favorites, source: :items

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: true, presence: true
  validates :name, presence: true
end
