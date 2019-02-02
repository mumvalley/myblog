# binding.pryでデバッグできる
class BoardsController < ApplicationController
  before_action :set_board, only: %i[show edit update destroy]
  # 投稿一覧の取得
  def index
    @boards = Board.page(params[:page])
  end

  # 新規作成画面表示
  def new
    @board = Board.new
  end

  # 新規作成画面の入力を受けて登録処理
  def create
    board = Board.new(board_params)
    if board.save
      redirect_to "/boards"
    else
      redirect_to :back
    end
  end

  # 詳細画面の表示
  def show
  end

  # 編集画面の表示
  def edit
  end

  def update
    @board.update(board_params)
    redirect_to @board
  end

  def destroy

  end

  private
    def board_params
      params.require(:board).permit(:title, :body)
    end

    # boardsテーブルからidを取得し@boardに格納
    def set_board
      @board = Board.find(params[:id])
    end
end
