# binding.pryでデバッグできる
class BoardsController < ApplicationController
  def index
    @board = Board.all
  end

  def new
    @board = Board.new
  end

  def create
    board = Board.new(board_params)
    if board.save
      redirect_to "/boards"
    else
      redirect_to :back
    end
  end

  def edit

  end

  private
    def board_params
      params.require(:board).permit(:title, :body)
    end
end
