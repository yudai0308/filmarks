class YearsController < ApplicationController

  def index
    @search_age_name = params[:age_id].to_i
    first_year = @search_age_name
    last_year = @search_age_name +10
    movies_all = Movie.order('production DESC')
    @search_movies =  movies_all.where("production >= ?",first_year).where("production < ?",last_year)
    @search_movies_count = @search_movies.count
    @page_of_movie = @search_movies.page(params[:page]).per(36)
    @movies_age = movies_all.group(:production).map{|movie| movie.production.to_i}
  end


  def show
    @search_age_name = params[:age_id].to_i
    @search_year_name = params[:id].to_i
    movies_all = Movie.order('production DESC')
    @search_movies =  movies_all.where("production = ?", @search_year_name)
    @search_movies_count = @search_movies.count
    @page_of_movie = @search_movies.page(params[:page]).per(36)
    @movies_age = movies_all.group(:production).map{|movie| movie.production.to_i}
    render 'index'
  end

end
