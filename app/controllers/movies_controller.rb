class MoviesController < ApplicationController

  def index
  end

  def show
    @movie = Movie.find(params[:id])
    @reviews = @movie.reviews.page(params[:page]).per(5).order("created_at DESC")
    # --- 平均値を求める処理 ---
    reviews_array = []
    @reviews.each do |review|
      reviews_array << review[:score]
    end
    reviews_count = reviews_array.length
    reviews_sum = reviews_array.sum
    @review_ave = reviews_sum / reviews_count

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
end
