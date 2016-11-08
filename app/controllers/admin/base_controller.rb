class Admin::BaseController < ApplicationController
  before_action :logged_in
  
  layout "admin"
  private
    def logged_in
      unless admin_logged_in?
        flash[:danger] = t(:please_log_in)
        redirect_to admin_login_path
      end
    end
end