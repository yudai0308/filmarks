class RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    user = params[:followed_id]
    current_user.follow(user)
    @passive_user_followers_count = passive_user_followers_count(user)
    @active_user_followers_count = active_user_followings_count(current_user.id)
    respond_to do |format|
      format.html { redirect_to controller: 'lists', action: 'user' }
      format.json {
        render json: {
          passive_count: @passive_user_followers_count,
          active_count: @active_user_followers_count,
          active_user_id: current_user.id,
          passive_user_id: user,
        }
      }
    end
  end

  def destroy
    user = params[:id]
    current_user.unfollow(user)
    @passive_user_followers_count = passive_user_followers_count(user)
    @active_user_followers_count = active_user_followings_count(current_user.id)
    respond_to do |format|
      format.html { redirect_to controller: 'lists', action: 'user' }
      format.json {
        render json: {
          passive_count: @passive_user_followers_count,
          active_count: @active_user_followers_count,
          active_user_id: current_user.id,
          passive_user_id: user,
        }
      }
    end
  end

  private
  def passive_user_followers_count(user_id)
    User.find_by(id:user_id).followers.count
  end
  def active_user_followings_count(user_id)
    User.find_by(id:user_id).following.count
  end

end
