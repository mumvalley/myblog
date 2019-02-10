module SessionsHelper

  # 渡されたユーザーでログインする
  def log_in(user)
    session[:user_id] = user.id
  end

  # 現在ログイン中のユーザーを返す(いる場合/いない場合=nil)
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id]) # いる場合user_idを@current_userに代入
    end
  end

  # ログインしていればtrue、その他ならfalseを返す
  def logged_in?
    !current_user.nil?
  end

end
