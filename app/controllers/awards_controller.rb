class AwardsController < ApplicationController

  def show
    @award_all_list = Award.all
    if params[:name]
      @search_name = params[:name]
      @search_subname = ""
      award = @award_all_list.where(name: params[:name])
      movies = award.map{|award|award.movies}.flatten
      @search_movies = Kaminari.paginate_array(movies).page(params[:page]).per(36)
      @search_movies_count = @search_movies.count
    else
      award = @award_all_list.find_by(id: params[:id])
      @search_name = "#{ award.name }"
      @search_subname = "#{ award.subname }"
      @search_movies = award.movies.page(params[:page]).per(36)
      @search_movies_count = award.movies.count
    end
      @award_index = @award_all_list.group(:name).map{
        |award|[
          award.name,
          @award_all_list.where(name: award.name).map{|award_list| award_list.movies.count}.sum,
          @award_all_list.where(name: award.name)
        ]
      }
  end
end
