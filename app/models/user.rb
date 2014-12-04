class User < ActiveRecord::Base
  attr_accessor :password_signup
  attr_accessor :twitter_signup

  has_many :posts
  has_many :comments
  has_many :events
  has_many :tools

  has_secure_password validations: false
  validates :password, length: { minimum: 4 }, confirmation: true, if: :password_signup

  validates :email, presence: true, confirmation: true, if: :twitter_signup
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

end
