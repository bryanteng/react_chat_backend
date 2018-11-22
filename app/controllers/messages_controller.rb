class MessagesController < ApplicationController

  def index
    @messages = Message.all
    render json: @messages
  end

  def show
    @message = Message.find(params[:id])
    render json: @message
  end

  def create
    @message = Message.new(context: params[:context], user_id: params[:user_id], classroom_id: params[:classroom_id])
    if @message.save
      render json: @message, status: :accepted
    else
      render json: {errors: @message.errors.full_messages}, status: :unprocessable_entity
    end

  end

  def update
    @message = Message.find(params[:id])

    if @message.update(message_params)
      render json: @message, status: :accepted
    else
      render json: {errors: @message.errors.full_messages}, status: :unprocessable_entity
    end

  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
  end

  private

  def message_params
    params.require(:message).permit(:context, :user_id, :classroom_id)
  end

end
