class MembershipsController < ApplicationController

  def create
    @user = User.find_by(id: params[:user_id])
    if family = family = User.find_by(email: params[:email])
      Membership.create(user_id: @user.id, family_id: family.id)
      Membership.create(user_id: family.id, family_id: @user.id)
      if request.xhr?
        render @user.memberships.count
      end
      redirect_to @user
    else
      redirect_to @user
    end
  end

end
