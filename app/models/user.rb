class User < ApplicationRecord
  include JwtToken
  authenticates_with_sorcery!

  validates :password, length: { minimum: 3, maximum: 45 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, uniqueness: { case_sensitive: false }, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :name, presence: true
end
