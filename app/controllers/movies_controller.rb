class MoviesController < ApplicationController

  def index
  end

  def show
  end

  def search
    if params[:button] == "user"
# Viewが出来たら変更↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
      @movies = Movie.where('title LIKE(?)', "%#{params[:keyword]}%").page(params[:page]).per(36)
      render action:'search_movie'
#↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑
    elsif params[:button] == "cast"
# Viewが出来たら変更↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
      @movies = Movie.where('title LIKE(?)', "%#{params[:keyword]}%").page(params[:page]).per(36)
      render action:'search_movie'
#↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑
    else
      @movies = Movie.where('title LIKE(?)', "%#{params[:keyword]}%").page(params[:page]).per(36)
      render action:'search_movie'
    end
  end
end
