class ShareController < ApplicationController
  include ApplicationHelper

  def create
    # binding.pry
    @user = current_user
    old_memory = Memory.find_by(id: params[:format])
    @memory = Memory.new(title: old_memory.title, url: old_memory.url, description: old_memory.description, story: old_memory.story, private: old_memory.private, user_id: @user.id)
    if @memory.save
      redirect_to user_path(current_user.id)
    end
  end

end
