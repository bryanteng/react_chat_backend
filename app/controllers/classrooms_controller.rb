class ClassroomsController < ApplicationController

  def index
    @classrooms = Classroom.all
    render json: @classrooms
  end

  def show
    @classroom = Classroom.find(params[:id])
    render json: @classroom
  end

  def create
    classroom = Classroom.new(classroom_params)
    if classroom.save
      serialized_data = ActiveModelSerializers::Adapter::Json.new(
        ClassroomSerializer.new(classroom)
      ).serializable_hash
      ActionCable.server.broadcast 'classrooms_channel', serialized_data
      head :ok
    end
  end

  def update
    @classroom = Classroom.find(params[:id])

    if @classroom.update(classroom_params)
      render json: @classroom, status: :accepted
    else
      render json: {errors: @classroom.errors.full_messages}, status: :unprocessable_entity
    end

  end

  def destroy
    @classroom = Classroom.find(params[:id])
    @classroom.destroy
  end

  private

  def classroom_params
    params.require(:classroom).permit(:name, :subject)
  end

end
