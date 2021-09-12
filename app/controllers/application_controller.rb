class ApplicationController < ActionController::Base
  private

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user;

  def require_signin
    unless current_user
      session[:intended_url] = request.url
      redirect_to new_sessions_path, alert: "Debes iniciar sesión para hacer esto"
    end
  end

  def require_guest
    unless current_user.blank?
      redirect_to clients_path, alert: "Ya iniciaste sesión"
    end
  end
end
