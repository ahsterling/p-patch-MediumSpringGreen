class Tool < ActiveRecord::Base
  belongs_to :user

  validates :name, presence: true
  validates :status, presence: true
  validates :status, format: { with: /in|out/, message: "must be in or out"}

  def set_user_id(current_user_id)
    if status == "out"
      update(user_id: current_user_id)
    elsif status == "in"
      update(user_id: nil)
    end
  end
end
