class ReviewsController < ApplicationController

  before_action :set_movie

  def index
  end

  def create
    review = Review.new(review_params)
    review.save
    tag = Tag.new(tag_params)
    tag.split(/\s*/)
    tag.each do ||
    tag.save
    # redirect_to movie_path(params[:movie_id])
    render :js => "window.location = '/movies/#{params[:movie_id]}"
  end

  private

  def review_params
    params.require(:review).permit( :comment,
                                    :score,
                                    :status,
                                   { tag_ids: [] }
                            ).merge( user_id:  current_user.id,
                                     movie_id: params[:movie_id])
  end

  def tag_params
    params.require(:tag).permit(:name, :review_id)
  end

  def set_movie
    @moview = Movie.find(params[:movie_id])
  end
end
