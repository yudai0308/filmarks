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
  end

  def genre
  end

  def year
  end

  def tag
  end

  def index
    @movies_now = Movie.order('created_at DESC').limit(5)
    @movies_comming  = Movie.order("RAND()").limit(5)
    @movies_upcomming  = Movie.order("RAND()").limit(5)
    @movies_trend  = Movie.order("RAND()").limit(5)
    @countries = Country.all
    @genres = Genre.all
    @awards = Award.group(:name)
    @movies_product = Movie.group(:time)
    @movies_rental = @movies_trend  = Movie.order("RAND()").limit(3)
  end
end
