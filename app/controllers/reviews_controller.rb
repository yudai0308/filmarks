class ReviewsController < ApplicationController

  before_action :set_movie

  def show
    @movie = Movie.find(params[:movie_id])
    @review = Review.find(params[:id])
    @comment = Comment.new
    @comments = @review.comments.page(params[:page]).per(5).order("created_at DESC")
  end

  def create
    @review = Review.new(review_params)
    if @review.score == 9
      @review.score = nil
    end
    @review.save

    tags = Tag.new(tags_params) if Tag.new(tags_params)
    tags.name = params[:tag][:name]
    tags_array = tags.name.split(/\s/)
    tags_array.each do |tag|
      if tag =~ /^#.+/
        tag_for_record = Tag.new(tags_params)
        tag_for_record.name = tag
        tag_for_record.save
        tag_for_record.review_ids = @review.id
        tag_for_record.save
      end
    end

    redirect_to movie_path(params[:movie_id])
  end

  private

  def review_params
    params.require( :review
          ).permit( :comment,
                    :score,
                    :status,
           ).merge( user_id: current_user.id,
                    movie_id: params[:movie_id])
  end

  def tags_params
    params.require(:tag).permit(:name)
  end

  def set_movie
    @moview = Movie.find(params[:movie_id])
  end
end
