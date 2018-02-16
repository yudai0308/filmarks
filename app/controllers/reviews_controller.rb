class ReviewsController < ApplicationController

  before_action :set_movie

  def index
  end

  def create

    @review = Review.new(review_params)
    if @review.score == 9
      @review.score = nil
      binding.pry
    end
    @review.save

    tags = Tag.new(tags_params)[:name] if Tag.new(tags_params)[:name]
    tags_array = tags.split(/\s/)
    tags_array.each do |tag|
      if tag =~ /^#.+/
        tag_for_record = Tag.new(tags_params)
        tag_for_record.name = tag
        tag_for_record.save
        tag_for_record.review_ids = @review.id
        tag_for_record.save
      end
    end

    render :js => "window.location = '/movies/#{params[:movie_id]}'"
  end

  private

  def review_params
    params.require(
            :review).permit(
                      :comment,
                      :score,
                      :status).merge(
                                user_id: current_user.id,
                                movie_id: params[:movie_id])
  end

  def tags_params
    params.require(:tags).permit(:name)
  end

  def set_movie
    @moview = Movie.find(params[:movie_id])
  end
end
