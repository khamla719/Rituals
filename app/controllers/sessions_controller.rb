class SessionsController < ApplicationController
  # protect_from_forgery with: :reset_session
  def show
  end

  def create
    @user = User.find_by(email: params[:user][:email].downcase)

    if @user && @user.authenticate(params[:user][:password])
      session[:id] = @user.id
      redirect_to @user
    else
      redirect_to root_path
    end
  end

  def destroy
    session[:id] = nil
    redirect_to root_path
  end
end
