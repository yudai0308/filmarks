class ListsController < ApplicationController
  def now
    @movies = Movie.page(params[:page]).per(36).order("created_at DESC")
  end

  def comming
    @movies = Movie.page(params[:page]).per(36).order("created_at DESC")
  end

  def upcomming
    @movies = Movie.page(params[:page]).per(36).order("created_at DESC")
  end

  def trend
    # reviews = Review.pluck(:movie_id, :score)
    @movies = Movie.page(params[:page]).per(36).order("created_at DESC")
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

end
