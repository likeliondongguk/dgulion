class MypageController < ApplicationController
  def index
    @user=User.find(params[:user_id])
    @reply=@user.comments+@user.answers
    render 'home/mypage'
  end
end
