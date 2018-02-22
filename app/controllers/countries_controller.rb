class CountriesController < ApplicationController

  before_action :build_review_and_tag_model

  def index
    countries = Country.all
    @search_country = countries.find(params[:country_id])
    @movies = @search_country.movies.order('time DESC').page(params[:page]).per(36)
    @popular_movies = @movies.limit(3)
    @country_index = countries.limit(20)
    @country_index_other = countries.offset(20).map{|country| [country,country.movies,country.movies.count]}
    set_movies_infos(@movies)
  end

  def others
    @country_index_other = Country.offset(20).map{|country| [country,country.movies,country.movies.count]}
    movies = @country_index_other.map{ |country,movie,count| movie }.flatten
    @movies = Kaminari.paginate_array(movies).page(params[:page]).per(36)
    @all_movie_count = @country_index_other.map{ |country,movie,count| count }.sum
    set_movies_infos(@movies)
  end

  private

  def build_review_and_tag_model
    @review = Review.new
    @tag = Tag.new
  end

  def set_movies_infos(movies)
    @movies_infos_array = []
    movies.each do |movie|
      scores_array = []
      movie.reviews.each do |review|
        scores_array << review.score unless review.score == nil
      end
      if scores_array.length > 0
        score_ave = (scores_array.sum) / (scores_array.length)
      end
      movie_infos = {reviews_count: scores_array.length, score_ave: score_ave}
      @movies_infos_array << movie_infos
    end
  end
end
