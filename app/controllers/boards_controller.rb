class BoardsController < ApplicationController

  before_action :set_board, only: [:show, :edit, :update, :destroy ]
  def index
    if params[:search]
      @boards = Category.get_posts("board").search(params[:search]).order("created_at DESC")
    else
      @boards = Category.get_posts("board").all.order('created_at DESC')
    end
  end
  def show
  end


  def new
    @board = Post.new
  end
  def create
    @board=Post.new(board_params)
    @board.category=Category.find_by_name("board")
    @board.user=current_user
    @board.save
    redirect_to url_for(controller: :boards, action: :index, id: @board.id)
  end
  def edit
  end
  def update
    @board.update(board_params)
    redirect_to @board
  end
  def destroy
    @board.destroy
    redirect_to @board
  end

  private
  def set_board
    @board=Category.get_posts("board").find(params[:id])
  end
  def board_params
    params.require(:post).permit(:title, :content)
  end
end
