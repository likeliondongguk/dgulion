class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :edit, :update, :destroy ]
  def index
    @boards=Board.all
  end
  def show
  end
  def new
    @board = Board.new
  end
  def create
    @board=Board.new(board_params)
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
    @board=Board.find(params[:id])
  end
  def board_params
    params.require(:board).permit(:title, :content)
  end
end
