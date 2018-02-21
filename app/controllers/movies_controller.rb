class MoviesController < ApplicationController

  def index
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

    # --- 年代のリンク作成 ---
    year = @movie.production.delete("年").to_i
    if year >= 2010
      @year_url = "/lists/year/2010s/#{year}"
    elsif year >= 2000
      @year_url = "/lists/year/2000s/#{year}"
    elsif year >= 1990
      @year_url = "/lists/year/1990s/#{year}"
    elsif year >= 1980
      @year_url = "/lists/year/1980s/#{year}"
    elsif year >= 1970
      @year_url = "/lists/year/1970s/#{year}"
    elsif year >= 1960
      @year_url = "/lists/year/1960s/#{year}"
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
end
