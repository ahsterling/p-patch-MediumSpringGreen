class User < ActiveRecord::Base
  attr_accessor :password_signup

  has_many :posts
  has_many :comments
  has_many :events
  has_many :tools

  has_secure_password validations: false
  validates :password, length: { minimum: 4 }, confirmation: true, if: :password_signup


end
