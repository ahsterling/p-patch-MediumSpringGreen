class Tool < ActiveRecord::Base
  belongs_to :user

  validates :kind, presence: true
  validates :status, presence: true
  validates :status, format: { with: /in|out/, message: "must be in or out"}
end
