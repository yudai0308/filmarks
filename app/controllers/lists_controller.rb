class ListsController < ApplicationController
  def now
  end

  def comming
  end

  def upcomming
  end

  def trend
  end

  def country
  end

  def genre
  end

  def year
  end

  def tag
  end

  def index
    @movies_now = Movie.order('created_at DESC').limit(5)
    @movies_comming  = Movie.order("RAND()").limit(5)
    @movies_upcomming  = Movie.order("RAND()").limit(5)
    @movies_trend  = Movie.order("RAND()").limit(5)
  end
end
