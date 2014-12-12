class EventsController < ApplicationController
  before_action :find_user

  def index
  end

  def new
    @event = Event.new
  end

  def create
    redirect_to events_path
  end

  private

  def find_user
    @user = current_user if logged_in?
  end
end
