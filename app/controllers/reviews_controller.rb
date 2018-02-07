class ReviewsController < ApplicationController

  def create
    review = Review.new(review_params)
    review.save

    tag = Tag.where(name: tags_params).first_or_initialize
    tag.save

    redirect_to :root
    # 最終的に映画詳細ページがリロードされるように設定
  end

  private

  def review_params
    params.require(:review).permit( :comment,
                                    :score,
                                    :status
                           ).marge( user_id:  current_user.id,
                                    movie_id: params[:movie.id])
  end

  def tags_params
    params.require(:tag).permit(:name)
  end
end
