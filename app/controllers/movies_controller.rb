class MoviesController < ApplicationController

  before_action :build_review_and_tag_model

  def index
    user = current_user
    @user_actions = user.active_relationships.map{
      |user|[
        user.followed.reviews,
        user.followed.clips,
        user.followed.users_members
      ]
    }.flatten.sort_by! { |a| a[:created_at] }.reverse
    # @user_actions_page = @user_actions.per(30)
  end

  def show
    @movie = Movie.find(params[:id])
    @review = Review.new
    @tag = Tag.new
    @reviews = @movie.reviews.page(params[:page]).per(5).order("created_at DESC")
    @all_reviews = @movie.reviews
    # --- 平均値を求める処理 ---
    @scores_array = []
    @movie.reviews.each do |review|
      @scores_array << review.score unless review.score == nil
    end
    if @scores_array.length > 0
      @review_ave = (@scores_array.sum) / (@scores_array.length)
    end

    @clip = Clip.find_by(movie_id: params[:id], user_id: current_user.id)
  end

  def search
    if params[:button] == "user"
      @users_count = User.where('nickname LIKE(?)', "%#{params[:keyword]}%").count
      @users = User.where('nickname LIKE(?)', "%#{params[:keyword]}%").page(params[:page]).per(24)
      render action:'search_user'
    elsif params[:button] == "cast"
      @casts_count = Member.where('name LIKE(?)', "%#{params[:keyword]}%").count
      @casts = Member.where('name LIKE(?)', "%#{params[:keyword]}%").page(params[:page]).per(24)
      render action:'search_cast'
    else
      @movies_count = Movie.where('title LIKE(?)', "%#{params[:keyword]}%").count
      @movies = Movie.where('title LIKE(?)', "%#{params[:keyword]}%").page(params[:page]).per(36)
      render action:'search_movie'
    end
  end

  private

  def build_review_and_tag_model
    @review = Review.new
    @tag = Tag.new
  end

end
