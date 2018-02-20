class ListsController < ApplicationController

  before_action :build_review_and_tag_model

  def now
    @movies = Movie.page(params[:page]).per(36).order("created_at DESC")
    set_movies_infos
  end

  def comming
    @movies = Movie.page(params[:page]).per(36).order("created_at DESC")
    set_movies_infos
  end

  def upcomming
    @movies = Movie.page(params[:page]).per(36).order("created_at DESC")
    set_movies_infos
  end

  def trend
    # reviews = Review.pluck(:movie_id, :score)
    @movies = Movie.page(params[:page]).per(36).order("created_at DESC")
    set_movies_infos
  end

  def country
    @countries = Country.all
  end

  def genre
    @genres = Genre.all
  end

  def year
    @movies_age = Movie.group(:production).order('production DESC').map{|movie| movie.production.to_i}
  end

  def tag
  end

  def award
    @awards = Award.group(:name).order('id ASC').pluck(:name)
  end

  def index
    @movies_now = Movie.order('production DESC').limit(10).order("RAND()").limit(5)
    @movies_comming  = Movie.order('production DESC').limit(5)
    @movies_upcomming  = Movie.order('production DESC').limit(5)
    @movies_trend  = Movie.order("RAND()").limit(5)
    @countries = Country.all
    @genres = Genre.all
    @awards = Award.group(:name)
    @movies_age = Movie.group(:production).order('production DESC').map{|movie| movie.production.to_i}
    @movies_rental = Movie.order('production DESC').limit(10).order("RAND()").limit(3)
  end
  def user
    # ↓フォロワー数で取得？
    @users = User.all.limit(50)
  end

  private

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
