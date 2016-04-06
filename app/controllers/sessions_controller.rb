class SessionsController < ApplicationController
  # protect_from_forgery with: :reset_session
  def show
  end

  def create
    # binding.pry
    @user = User.find_by(email: params[:user][:email].downcase)

    if @user && @user.authenticate(params[:user][:password])
      session[:id] = @user.id
      redirect_to @user
    #      p '*' * 50
    # p session[:id]
    # p '*' * 50

    else
      # Create an error message.
      redirect_to root_path
    end
  end

  def destroy
    session[:id] = nil
    redirect_to root_path
  end
end
