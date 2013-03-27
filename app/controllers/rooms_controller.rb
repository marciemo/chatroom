class RoomsController < ApplicationController

def create
    room = Room.new(params[:room])

    if room.save
      render :json => room, :status => :created
    else
      render :json => room.errors, :status => :unprocessable_entity
    end
  end

  def index
    rooms = Room.all
    render :json => rooms
  end

  def show
    room = Room.find(params[:id])
    render :json => room
  end

  
end