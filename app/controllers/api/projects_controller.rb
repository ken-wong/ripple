class Api::ProjectsController < Api::BaseController
  skip_before_action :authenticate_user!
  def index
    @projects = Project.all
  end
end