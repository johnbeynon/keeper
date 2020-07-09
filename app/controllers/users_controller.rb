class UsersController < ApplicationController
  skip_before_action :require_login

  def new
    @invite = Invitation.find_by_token(params[:token])
    if @invite
      redirect_to '/auth/google_oauth2'
    end
  end
end
