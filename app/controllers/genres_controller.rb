class GenresController < ApplicationController

before_action :build_review_and_tag_model

  def show
    @genre_index = Genre.all
    @search_genre = @genre_index.find(params[:id])
    @movies = @search_genre.movies.order('time DESC').page(params[:page]).per(36)
    @popular_movies = @movies.limit(3)
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
