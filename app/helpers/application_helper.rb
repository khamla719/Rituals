module ApplicationHelper
  def current_user
    if session[:id] != nil
      @user = User.find_by(id: session[:id])
    end
  end
end
