class EventsController < ApplicationController
  before_action :find_user

  def index
    @events = Event.events_this_month
  end

  def new
    @event = Event.new
  end

  def create
    if @user
      @event = @user.events.new(event_params)
      if @event.save
        redirect_to events_path
      else
        render :new
      end
    else
      redirect_to events_path
    end
  end

  # if @admin
  #   @tool = Tool.new(tools_params)
  #   if @tool.save
  #     redirect_to tools_path
  #   else
  #     render :new
  #   end
  # else
  #   redirect_to tools_path
  # end


  private

  def find_user
    @user = current_user if logged_in?
  end

  def event_params
    params.require(:event).permit(
      :title,
      :description,
      :location,
      :date,
      :start_time,
      :end_time
    )
  end
end
