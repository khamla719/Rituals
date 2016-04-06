class MembershipsController < ApplicationController

  def create
    # binding.pry
    @user = User.find_by(id: params[:user_id])
    if @family = family = User.find_by(email: params[:email])
      Membership.create(user_id: @user.id, family_id: family.id)
      Membership.create(user_id: family.id, family_id: @user.id)
      if request.xhr?
        # binding.pry
        render partial: :membership
      end
      redirect_to @user
    else
      redirect_to @user
    end
  end

end
