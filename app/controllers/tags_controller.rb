class TagsController < ApplicationController
  def search
    @questions=Tag.get_posts(params[:tag_id], "questions").paginate(:page => params[:page], :per_page => 8)
    render 'questions/index'
  end
end
