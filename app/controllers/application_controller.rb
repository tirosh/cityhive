class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(
        :first_name,
        :last_name,
        :name,
        :email,
        :city,
        :password,
        :password_confirmation,
        hobby_ids: []
      )
    end

    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(
        :first_name,
        :last_name,
        :name,
        :email,
        :city,
        :password,
        :password_confirmation,
        :current_password,
        hobby_ids: []
      )
    end
  end
end
