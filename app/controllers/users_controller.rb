class UsersController < ApplicationController
  def review
    if user_signed_in?
      user = current_user
      @user_actions = user.reviews.order('created_at DESC')
      @review = Review.new
      @tag = Tag.new
      @comment = Comment.new
    else
      redirect_to controller: :toppage, action: :index
    end
  end
    @review = Review.new
    @tag = Tag.new
    @comment = Comment.new
  def clip
  end
end
