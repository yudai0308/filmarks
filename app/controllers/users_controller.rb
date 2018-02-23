class UsersController < ApplicationController

  before_action :build_review_and_tag_model
  before_action :redirect_to_top

  def review
    if user_signed_in?
      user = current_user
      @user_actions = user.reviews.order('created_at DESC').page(params[:page]).per(10)
      @comment = Comment.new
    else
      redirect_to controller: :toppage, action: :index
    end
  end

  def clip
    @movies = current_user.movies.page(params[:page]).per(36)
    set_movies_infos
  end

  def followers
    @followers = current_user.followers.page(params[:page]).per(36)
  end

  def following
    @following = current_user.following.page(params[:page]).per(36)
  end

  def fan
    @casts = current_user.members.page(params[:page]).per(36)
  end


  private
  def redirect_to_top
    redirect_to controller: :toppage, action: :index unless user_signed_in?
  end

  def build_review_and_tag_model
    @review = Review.new
    @tag = Tag.new
  end

  def set_movies_infos
    @movies_infos_array = []
    @movies.each do |movie|
      scores_array = []
      movie.reviews.each do |review|
        scores_array << review.score unless review.score == nil
      end
      if scores_array.length > 0
        score_ave = (scores_array.sum) / (scores_array.length)
      end
      movie_infos = {reviews_count: scores_array.length, score_ave: score_ave}
      @movies_infos_array << movie_infos
    end
  end
end
