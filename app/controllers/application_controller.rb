class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_local

  before_filter :set_current_user

  def set_current_user
    User.current_user = current_user
  end
  
  protected

  def set_local
    if params[:locale]&&["en","zh-CN"].include?(params[:locale])
      session[:locale]=params[:locale]
    end

   I18n.locale = session[:locale]||I18n.default_locale
  end

 def is_after(this_time,last_time)
    if this_time.year > last_time.year
        return true
    elsif this_time.month > last_time.month
        return true
    elsif this_time.day > last_time.day
        return true
    else 
        return false
    end
  end
end
