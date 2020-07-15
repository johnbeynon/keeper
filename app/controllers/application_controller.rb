class ApplicationController < ActionController::Base
  include ApplicationHelper
  before_action :require_login

  layout :determine_layout

  def determine_layout
    if logged_in?
      'authed'
    else
      'unauthed'
    end
  end
end
