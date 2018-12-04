class SessionsController < ApplicationController
  def login
    @user = User.find_by(username: user_params[:username])
    if(@user)
      render json: {
        user: {user_id:@user.id, username: @user.username}
      }
    else
      render json: {
        error: "Invalid Username or Password"
      }, status: :unauthorized
    end
  end


  def persist
    token = request.headers["Authorization"]
    begin
      payload = JWT.decode(token, ENV['SUPER_SECRET_KEY'], true)
    rescue JWT::DecodeError
      nil
    end
    if(payload)
      id = payload[0]["user_id"]
      @user = User.find(id)
      render json: {
        user: {user_id: @user.id, username: @user.username}
      }
    else
      render json: {
        error: "Invalid token"
      }
    end
  end


  private
  def user_params
    params.require(:user).permit(:username)
  end
end
