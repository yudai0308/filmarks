class RelationshipsController < ApplicationController

  def create
    user = params[:followed_id]
    current_user.follow(user)
    redirect_to controller: 'lists', action: 'user'
  end

  def destroy
    user = params[:id]
    current_user.unfollow(user)
    redirect_to controller: 'lists', action: 'user'
  end
















  # def create
  #   followed_user = params[:followed_id]
  #   follow(followed_user)
  #   redirect_to controller: 'lists', action: 'user'
  # end

  # def destroy
  #     @follow = Relationship.where(follower_id: current_user.id, followed_id: params[:id])
  #     @follow.destroy
  # end



  # private
  #    # ユーザーをフォローする
  #   def follow(other_user)
  #     Relationship.create(follower_id: current_user.id, followed_id: other_user)
  #   end

  #   # ユーザーをフォロー解除する
  #   def unfollow
  #     # followed = Relationship.where(follower_id: current_user.id, followed_id: params[:id])
  #     # followed.destroy
  #   end

  #   # 現在のユーザーがフォローしてたらtrueを返す
  #   def following?(other_user)
  #     following.include?(other_user)
  #   end
end
