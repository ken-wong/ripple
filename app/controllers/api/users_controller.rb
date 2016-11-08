class Api::UsersController < Api::BaseController

  def update_password
    if current_user.authenticate(params[:old_password])
      
      if current_user.update(password: params[:password])
        current_user.reset_auth_token
        current_user.reload
        render json: {token: current_user.authentication_token}, status: 200
      else
        render json: {}, status: 422
      end
    else
      render json: {message: "旧密码错误"}, status: 401
    end
  end
end