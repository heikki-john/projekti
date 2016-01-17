class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      #Log the user in and redirect to the user show page.
      log_in user
      remember token
      redirect_to user
    else
      flash.now[:danger] = 'sähköposti tai salasana väärin'
      render 'new'
    end
  end
  
  def destroy
    log_out
    redirect_to root_url
  end
end
