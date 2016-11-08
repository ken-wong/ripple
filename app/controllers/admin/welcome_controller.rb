class Admin::WelcomeController < Admin::BaseController
  skip_before_action :logged_in
  def index

  end
end