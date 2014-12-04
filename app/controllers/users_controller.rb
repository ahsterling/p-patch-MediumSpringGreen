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
    if User.find_by(uid: auth_hash.uid)
      @user = User.find_by(uid: auth_hash.uid)
      session[:user_id] = @user.id
      redirect_to root_path, notice: "You are logged in!"
    else
      @user = User.new(name: auth_hash.info.name, uid: auth_hash.uid)
      if @user.save
        session[:user_id] = @user.id
        redirect_to "/users/twitter_confirm"
      else
        redirect_to root_path, notice: "Sorry, an error ocurred!"
      end
    end
  end

  def confirm_with_twitter
    @user = current_user
  end

  def finalize_twitter
    @user = current_user
    @user.twitter_signup = true
    if @user.update(params.require(:user).permit(:name, :email))
      redirect_to root_path, notice: "You have signed up with twitter!"
    else
      render :finalize_twitter
    end
  end



  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation, :email)
  end

end
