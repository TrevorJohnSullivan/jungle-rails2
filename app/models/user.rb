# app/models/user.rb
class User < ApplicationRecord
  has_secure_password

  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true
  validates :password, presence: true, length: { minimum: 1 }, if: -> { new_record? || !password.nil? }
end

