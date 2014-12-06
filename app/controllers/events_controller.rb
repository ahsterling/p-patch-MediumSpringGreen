class EventsController < ApplicationController



  def index
    @meetings1 = Event.all
    @meeting = Event.new
  end


  def create
    @meeting = Event.new(event_params)
    if @meeting.save
      redirect_to events_path
    else
      @meetings1 = Event.all
      render :index
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    # raise
    if @event.update(event_params)
      redirect_to show_event_path(params[:id])
    else
      render :edit
    end

  end





  private

  def event_params
    params.require(:event).permit(:title, :content, :date, :user_id)
  end



end
