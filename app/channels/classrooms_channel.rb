class ClassroomsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "classrooms_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
