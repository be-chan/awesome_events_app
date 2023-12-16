class ApplicationController < ActionController::Base
  before_action :authenticate
  helper_method :logged_in?, :current_user

  private

  # ログインしているか？
  def logged_in?
    !!current_user
  end

  # ユーザーID取得
  def current_user
    return unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end

  # 未ログインの場合はトップページにリダレクト
  def authenticate
    return if logged_in?
    redirect_to welcome_index_path, alert: "ログインしてください"
  end
end
