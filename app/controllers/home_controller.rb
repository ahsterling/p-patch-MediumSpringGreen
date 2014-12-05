class HomeController < ApplicationController


  def index
    @events = Event.all

  end



  def login

   @login_user = User.find_by(name: params[:user][:name])
      if  @login_user.authenticate(params[:user][:password])
        session[:user_id] = @login_user.id
        redirect_to root_path, :notice => "Welcome back, #{@login_user.email}"
      else
        redirect_to root_path,  :notice => "Invalid email or password"
      end
  end

  def log_out
    session.delete(:user_id)
    @user = nil
  end

  def destroy
    log_out
    redirect_to root_path
  end


end
