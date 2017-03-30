class MypageController < ApplicationController
  def index
    @user=User.find(params[:user_id])
    @reply=@user.comments+@user.answers
    @posts=@user.posts.where(category_id: [1,2,4])
    render 'home/mypage'
  end
end
