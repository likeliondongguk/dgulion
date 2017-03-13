class TagsController < ApplicationController
  def search
    @questions=Tag.get_posts(params[:tag_id], "questions")
    render 'questions/index'
  end
end
