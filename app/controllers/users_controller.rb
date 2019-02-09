class UsersController < ApplicationController
  def new
    @user = User.new
  end

  # プロフィール画面
  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_url(@user)
      flash[:success] = "ようこそ「Huttsu no Blog」へ！！"
    else
      redirect_to new_user_path, flash: {
        error_messages: @user.errors.full_messages
      }
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email,:password, :password_confirmation)
    end
end
