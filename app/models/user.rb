class User < ActiveRecord::Base
  has_many :posts
  has_many :comments
  has_many :events
  has_many :tools
  has_secure_password
end
