class HomeController < ApplicationController
  def index
  end

  #
  # def login
  #   @login_user = User.find_by(email: params[:email])
  #   if @login_user.authenticate(params[:password])
  #     session[:user_id] = user.id
  #     redirect_to root_path, :notice => "Welcome back, #{user.email}"
  #   else
  #     flash.now.alert = "Invalid email or password"
  #     render "new"
  #   end
  # end


end
