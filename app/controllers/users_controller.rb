class UsersController < ApplicationController
  def new
    @user = User.new
  end

  # プロフィール画面
  def show
    @user = User.find(params[:id])
  end
end
