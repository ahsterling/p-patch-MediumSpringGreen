module ApplicationHelper
  def login_user
    @login_user = User.new
  end
end
