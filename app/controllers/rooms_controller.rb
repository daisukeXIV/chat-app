class RoomsController < ApplicationController
  def index
  end
  def new
    @room = Room.new
  end
  def create
    @room = Room.create(room_params)
    if @room.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def room_params
    params[:room][:user_ids]<<current_user.id
    params.require(:room).permit(:name,user_ids:[])
  end
end
