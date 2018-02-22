class AwardsController < ApplicationController

before_action :build_review_and_tag_model

  def show
    @award_all_list = Award.all
    if params[:name]
      @search_name = params[:name]
      @search_subname = ""
      award = @award_all_list.where(name: @search_name)
      movies = award.map{|award|award.movies}.flatten
      @movies = Kaminari.paginate_array(movies).page(params[:page]).per(36)
      @movies_count = movies.count
    else
      award = @award_all_list.find_by(id: params[:id])
      @search_name = "#{ award.name }"
      @search_subname = "#{ award.subname }"
      @movies = award.movies.page(params[:page]).per(36)
      @movies_count = award.movies.count
    end
      @award_index = @award_all_list.group(:name).map{
        |award|[
          award.name,
          @award_all_list.where(name: award.name).map{|award_list| award_list.movies.count}.sum,
          @award_all_list.where(name: award.name)
        ]
      }
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
