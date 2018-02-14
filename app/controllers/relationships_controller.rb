class RelationshipsController < ApplicationController

  def create
    user = params[:followed_id]
    current_user.follow(user)
        binding.pry
    redirect_to controller: 'lists', action: 'user'

  end

  def destroy
    user = params[:id]
    current_user.unfollow(user)
        binding.pry
    redirect_to controller: 'lists', action: 'user'

  end
end
