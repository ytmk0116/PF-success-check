class ApplicationController < ActionController::Base
  helper_method :current_user　#全てのビューで利用できる
  before_action :login_required #ログインしていなければ利用できない

  private

    def current_user　#全てのコントローラーから利用できる
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def login_required
      redirect_to login_url unless current_user
    end
end
