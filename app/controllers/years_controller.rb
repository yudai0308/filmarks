class YearsController < ApplicationController

before_action :build_review_and_tag_model

  def index
    @search_age_name = params[:age_id].to_i
    first_year = @search_age_name
    last_year = @search_age_name +10
    movies_all = Movie.order('production DESC')
    @search_movies =  movies_all.where("production >= ?",first_year).where("production < ?",last_year)
    @search_movies_count = @search_movies.count
    @movies = @search_movies.page(params[:page]).per(36)
    @movies_age = movies_all.group(:production).map{|movie| movie.production.to_i}
    set_movies_infos(@movies)
  end


  def show
    @search_age_name = params[:age_id].to_i
    @search_year_name = params[:id].to_i
    movies_all = Movie.order('production DESC')
    @search_movies =  movies_all.where("production = ?", @search_year_name)
    @search_movies_count = @search_movies.count
    @movies = @search_movies.page(params[:page]).per(36)
    @movies_age = movies_all.group(:production).map{|movie| movie.production.to_i}
    set_movies_infos(@movies)
    render 'index'
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
