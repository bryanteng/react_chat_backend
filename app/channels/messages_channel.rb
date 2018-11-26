class MessagesChannel < ApplicationCable::Channel
  def subscribed
    classroom = Classroom.find(params[:classroom_id])
    stream_for classroom
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
