class TagsController < ApplicationController

  def index
  end

  def create
    tag = Tag.where(name: tags_params).first_or_initialize
    tag.save
  end

  private

  def tags_params
    params.require(:tag).permit(:name)
  end

end
