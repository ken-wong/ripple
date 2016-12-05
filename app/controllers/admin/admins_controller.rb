class Admin::AdminsController < Admin::BaseController
  def index
    @admins = Admin.all
    @admin = Admin.new
  end

  def edit
    @admin = Admin.find(params[:id])
  end

  def update
    @admin = Admin.find(params[:id])
    @admin.update(name: params[:admin][:name])
    redirect_to admin_admins_path
  end
end