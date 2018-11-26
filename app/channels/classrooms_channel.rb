class ClassroomsChannel < ApplicationCable::Channel
  def subscribed
<<<<<<< HEAD
	classroom = Classroom.find(params[:classroom_id])
    stream_for classroom
=======
    stream_from "classrooms_channel"
>>>>>>> adding_action_cables
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
