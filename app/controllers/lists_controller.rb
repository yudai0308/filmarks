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
end
