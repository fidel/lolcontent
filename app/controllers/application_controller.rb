class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  def current_admin_user
    if current_user && current_user.has_role?(:admin)
      current_user
    end
  end

end
