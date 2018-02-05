class MoviesController < ApplicationController

  def index
  end

  def show
  end

  def search
    @movies = Movie.where('title LIKE(?)', "%#{params[:keyword]}%").page(params[:page]).per(36)
  end
end
