module SessionsHelper
  #logs in the given user
  def log_in(user)
    session[:user_id] = user.id
  end
  
  #Return the current logged in user (if nay)
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  
  #Returns true if user is logged in, false otherwise
  def loggeg_in?
    !current_user.nil?
  end
  
  #logs out the current user
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
  
  #Remembers user in a persisten session
  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user_id
    cookies.permanent[:remember_token] = user.remember_token
  end
end
