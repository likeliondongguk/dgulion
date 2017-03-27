class HomeController < ApplicationController
  def index
    @notice= Post.where(category_id: [Category.find_by_name("notice").id, Category.find_by_name("event").id]).limit(8)
    @events= Sch.where(home_check: true).order(date: :asc)
  end
end
