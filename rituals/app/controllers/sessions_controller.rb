class SessionsController < ApplicationController
  def show
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    # binding.pry
    if @user && @user.authenticate(params[:session][:password])
      redirect_to @user
    else
      # Create an error message.
      render 'new'
    end
  end

  def destory
    session[:id] = nil
    redirect '/'
  end
end