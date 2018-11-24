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
    message = Message.new(message_params)
    classroom = Classroom.find(message_params[:classroom_id])
    if message.save
      serialized_data = ActiveModelSerializers::Adapter::Json.new(
        MessageSerializer.new(message)
      ).serializable_hash
      MessagesChannel.broadcast_to classroom, serialized_data
      head :ok
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
