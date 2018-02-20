class GenresController < ApplicationController

  def show
    @search_genre = Genre.find(params[:id])
    @search_genre_movies = @search_genre.movies.order('time DESC').page(params[:page]).per(36)
    @popular_movies = @search_genre_movies.limit(3)
    @genre_index = Genre.all
  end
end
