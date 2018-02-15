class ReviewsController < ApplicationController

  before_action :set_movie

  def index
  end

  def create

    @review = Review.new(review_params)
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


# [21] pry(#<ReviewsController>)> @review.tag_ids = [89,90]
#   Tag Load (0.4ms)  SELECT `tags`.* FROM `tags` WHERE `tags`.`id` IN (89, 90)
#    (0.2ms)  BEGIN
#   SQL (0.4ms)  INSERT INTO `reviews_tags` (`review_id`, `tag_id`, `created_at`, `updated_at`) VALUES (112, 90, '2018-02-15 13:03:04', '2018-02-15 13:03:04')
#    (1.5ms)  COMMIT
# => [89, 90]
# [22] pry(#<ReviewsController>)> @review.tag_ids
# => [89, 90]
# [23] pry(#<ReviewsController>)> @review.tag_ids.save
# NoMethodError: undefined method `save' for [89, 90]:Array
# from (pry):110:in `create'
# [24] pry(#<ReviewsController>)> @review.save
#    (0.2ms)  BEGIN
#    (0.2ms)  COMMIT
# => true
# [25] pry(#<ReviewsController>)> @review.reviews_tags
#   ReviewsTag Load (0.4ms)  SELECT `reviews_tags`.* FROM `reviews_tags` WHERE `reviews_tags`.`review_id` = 112
# => [#<ReviewsTag:0x007f8f76818578
#   id: 2,
#   review_id: 112,
#   tag_id: 89,
#   created_at: Thu, 15 Feb 2018 13:02:59 UTC +00:00,
#   updated_at: Thu, 15 Feb 2018 13:02:59 UTC +00:00>,
#  #<ReviewsTag:0x007f8f749081b0
#   id: 3,
#   review_id: 112,
#   tag_id: 90,
#   created_at: Thu, 15 Feb 2018 13:03:04 UTC +00:00,
#   updated_at: Thu, 15 Feb 2018 13:03:04 UTC +00:00>]
# [26] pry(#<ReviewsController>)> @review.reviews_tags
# => [#<ReviewsTag:0x007f8f76818578
#   id: 2,
#   review_id: 112,
#   tag_id: 89,
#   created_at: Thu, 15 Feb 2018 13:02:59 UTC +00:00,
#   updated_at: Thu, 15 Feb 2018 13:02:59 UTC +00:00>,
#  #<ReviewsTag:0x007f8f749081b0
#   id: 3,
#   review_id: 112,
#   tag_id: 90,
#   created_at: Thu, 15 Feb 2018 13:03:04 UTC +00:00,
#   updated_at: Thu, 15 Feb 2018 13:03:04 UTC +00:00>]
