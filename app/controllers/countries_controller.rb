class CountriesController < ApplicationController

  def index
    @search_country = Country.find(params[:country_id])
    @search_country_movies = @search_country.movies.order('time DESC').page(params[:page]).per(36)
    @popular_movies = @search_country_movies.limit(3)
    @country_index = Country.limit(20)
    @country_index_other = Country.offset(20).map{|country| [country,country.movies,country.movies.count]}
  end

  def others
    @country_index_other = Country.offset(20).map{|country| [country,country.movies,country.movies.count]}
    movies = @country_index.map{ |country,movie,count| movie }.flatten
    @search_country_movies = Kaminari.paginate_array(movies).page(params[:page]).per(36)
    @all_movie_count = @country_index.map{ |country,movie,count| count }.sum
  end
end
