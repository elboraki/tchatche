class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = 'you have successfuly logged in'
      redirect_to root_path

      # good scenatio
    else
      flash.now[:error] = 'something wrong in your information login'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'You have successfully logout'
    redirect_to login_path
  end
end
