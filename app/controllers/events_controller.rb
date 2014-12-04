class EventsController < ApplicationController



  def index
    @meetings = Event.all
    @meeting = Event.new
  end


  def create
    @meeting = Event.new(event_params)
    if @meeting.save
      redirect_to events_path
    else
      render :new
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :content, :date)
  end



end
