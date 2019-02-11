class SessionsController < ApplicationController
  # ログインページの表示
  def new
  end

  # ログインの状態の処理
  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      log_in user # session_heler.rbで定義
      redirect_to user_url(user)
      flash[:success] = "#{user.name}でログインに成功しました"
    else
      flash.now[:danger] = "メアドかパスワードが間違っています"
      render :new
    end
  end

  # ログアウトの処理
  def destroy
    log_out # session_heler.rbで定義
    redirect_to boards_path
  end
end
