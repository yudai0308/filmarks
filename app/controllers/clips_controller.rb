class ClipsController < ApplicationController

  def create
    # binding.pry
    Clip.create(movie_id: params[:movie_id], user_id: current_user.id)
    @movie = Movie.find(params[:movie_id])
    @clip = Clip.find_by(movie_id: params[:movie_id], user_id: current_user.id)
    respond_to do |format|
      format.html { redirect_to root_path }
      format.json
    end
  end

  def destroy
    # binding.pry
    clip = Clip.find_by(movie_id: params[:movie_id], user_id: current_user.id)
    clip.destroy
    @movie = Movie.find(params[:movie_id])
    respond_to do |format|
      format.html { redirect_to root_path }
      format.json
    end
  end

end
