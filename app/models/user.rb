require 'bcrypt'

class User < ActiveRecord::Base
  has_many :surveys
  validates :email, presence: true, uniqueness: true
  validates :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create
  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
