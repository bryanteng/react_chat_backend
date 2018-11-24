class UsersController < ApplicationController

  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def create
    @user = User.new(username: params[:username], password: params[:password])
    if @user.save
      render json: @user, status: :accepted
    else
      render json: {errors: @user.errors.full_messages}, status: :unprocessable_entity
    end

  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      render json: @user, status: :accepted
    else
      render json: {errors: @user.errors.full_messages}, status: :unprocessable_entity
    end

  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
  end

  def test_sockets
	classroom = Classroom.find(params[:id])
	ClassroomsChannel.broadcast_to classroom, "Yo what Up!? I'm a socket"
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end

end
