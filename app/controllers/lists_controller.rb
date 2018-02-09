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
    @movies_new = Movie.order('created_at DESC').limit(5)
    @movies_random  = Movie.order("RAND()").limit(5)
  end
end
