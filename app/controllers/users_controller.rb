class UsersController < ApplicationController

  def new
    @user = User.new

  end

  def create
    @user = User.new(user_params)
    @user.password_signup = true
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path

    else
      render :new
    end
  end

  def create_with_twitter
    auth_hash = request.env['omniauth.auth']
    @user = User.new(name: auth_hash.info.name, uid: auth_hash.uid)
    @user.save
    session[:user_id] = @user.id
    redirect_to "/users/twitter_confirm"
  end

  def confirm_with_twitter
    @user = current_user
  end

  def finalize_twitter
    @user = current_user
    if @user.update(params.require(:user).permit(:email))
      redirect_to "/"
    end
  end



  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation, :email)
  end

end
