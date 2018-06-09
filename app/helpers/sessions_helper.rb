module SessionsHelper

  def current_playground
    current_user.current_playground_id
  end

  def current_login
    current_user.user_name
  end

  def user_is_admin?
    current_user.is_admin
  end
  
  # Check for active session
  def signed_in_user
    redirect_to signin_url, notice: "You must log in to access this page." unless signed_in?
  end
  
  def set_locale
    if signed_in?
      I18n.locale = current_user.language || I18n.default_locale
    else
      I18n.locale = I18n.default_locale
    end
  end

end
