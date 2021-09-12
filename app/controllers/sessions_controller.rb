class SessionsController < ApplicationController
  before_action :require_signin, only: :destroy
  before_action :require_guest, only: :new

  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] =  user.id
      redirect_to (session[:intended_url] || clients_path), notice: "Bienvenido, #{user.to_s}!"
      session[:intended_url] = nil
    else
      flash.now[:alert] = "Credenciales invalidos!"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil

    redirect_to new_sessions_path, notice: 'Hasta pronto!'
  end
end
