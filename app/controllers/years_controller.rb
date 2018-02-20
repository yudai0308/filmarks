class YearsController < ApplicationController
  def index
    movies = Movie.order('production DESC')
    @movies = movies.group(:production).map{|movie| [movie.production.to_i, Movie.where(production: movie.production)]}.to_h
  end


  def show
    movies = Movie.order('production DESC')
    @movies = movies.group(:production).map{|movie| [movie.production.to_i, Movie.where(production: movie.production)]}.to_h
  end
end
