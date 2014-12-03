class User < ActiveRecord::Base
  has_many :posts
  has_many :comments
  has_many :events
  has_many :tools
  has_secure_password

  validates :name, presence: true
  validates :password, length: { minimum: 4 }

  validates :email, presence: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i


end
