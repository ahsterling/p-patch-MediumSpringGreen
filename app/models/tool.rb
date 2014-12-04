class Tool < ActiveRecord::Base
  belongs_to :user

  validates :name, presence: true
  validates :status, presence: true
  validates :status, format: { with: /in|out/, message: "must be in or out"}
end
