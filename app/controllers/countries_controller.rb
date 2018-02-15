class CountriesController < ApplicationController

  def index
    @search_country = Country.find(params[:country_id])
    @search_country_movies = @search_country.movies.order('time DESC').page(params[:page]).per(36)
    @popular_movies = @search_country_movies.limit(3)
    @country_index = Country.limit(20)
  end

  def other
    @country_index_other = Country.offset(20)
    @movies_all = Movie.joins(:countrys).where('country_id >= ?', '21')
  end
end
