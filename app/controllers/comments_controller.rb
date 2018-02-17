class CommentsController < ApplicationController
  def show
    binding.pry
    @movie = Movie.find(params[:movie_id])
    @review = Review.find(params[:id])
    @user = @review.user
    @comment = @review.comments
  end
end
