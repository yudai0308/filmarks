class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)
    comment.save
    redirect_to controller: :reviews,
                action:     :show,
                movie_id:   params[:movie_id],
                id:         params[:review_id]
  end

  private

  def comment_params
    params.require(:comment
          ).permit(:comment, :status
           ).merge( user_id: current_user.id,
                    review_id: params[:review_id])
  end
end
