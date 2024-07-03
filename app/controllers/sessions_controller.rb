class SessionsController < ApplicationController
  
  # GET /login
  def new
  end

  # POST /login
  def create
    user = User.find_by(name: params[:session][:name])
    if !user.nil? && user.authenticate(params[:session][:password])
      log_in user
      redirect_to root_path
    else
      flash.now[:danger] = '認証できませんでした。入力内容を確認してください。'
      render 'new', status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "ログアウトしました。"
  end

end