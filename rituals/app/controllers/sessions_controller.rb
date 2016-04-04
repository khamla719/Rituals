class SessionsController < ApplicationController
  def show
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    # binding.pry
    if @user && @user.authenticate(params[:session][:password])
      session[:id] = @user.id
      redirect_to user_path(@user.id)
    else
      # Create an error message.
      render 'new'
    end
  end

  def destroy
    session[:id] = nil
  redirect_to root_path
  end
end
