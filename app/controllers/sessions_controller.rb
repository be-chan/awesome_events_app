class SessionsController < ApplicationController
  # 未ログインでもcreateはログイン処理だから、スキップ
  skip_before_action :authenticate, only: :create

  def create
    user = User.find_or_create_from_auth_hash!(request.env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to welcome_index_path, notice: "ログインしました"
  end

  def destroy
    session[:user_id] = nil
    redirect_to welcome_index_path, alert: "ログアウトしました"
  end
end
