class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  # ログインしていない場合にログインページへ遷移
  # before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def production?
    Rails.env.production?
  end
  
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == Rails.application.credentials[:basic_auth][:user] &&
      password == Rails.application.credentials[:basic_auth][:pass]
    end
  end
  
  protected
  
  # ユーザー新規登録時のストロングパラメーター
  def configure_permitted_parameters

    # paramsにbirthdayを年月日に分けて追加
    if params[:birthday].present?
      birthday = params[:birthday]
      params["user"]["birth_year"] = birthday["birth_year(1i)"]
      params["user"]["birth_month"] = birthday["birth_year(2i)"]
      params["user"]["birth_day"] = birthday["birth_year(3i)"]
    end
    
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :first_name, :family_name, :first_name_kana, :family_name_kana, :birth_year, :birth_month, :birth_day])
  end
  
end
