class SessionsController < ApplicationController
  skip_before_action :require_login
  before_action :ensure_email_permitted, only: :omniauth

  def omniauth
    @user = User.from_omniauth(auth)
    if @user.save
      session[:user_id] = @user.id
      redirect_to home_path
    else
      render :not_found
    end
  end

  def destroy
    session.clear
    redirect_to '/goodbye'
  end

  def goodbye
  end
  
  private
  def auth
    request.env['omniauth.auth']
  end

  def ensure_email_permitted
    unless ENV['PERMITTED_USERS'].include? auth.info.email
      flash[:error] = "You don't have access, speak to your family"
      redirect_to login_path # halts request cycle
    end
  end
end
