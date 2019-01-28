class BoardsController < ApplicationController
  def index
    @board = Board.all
  end

  def new
    @board = Board.new
  end

  def create
    board = Board.create(board_params)
    redirect_to board
  end

  private
    def board_params
      params.require(:board).permit(:title, :body)
    end
end
