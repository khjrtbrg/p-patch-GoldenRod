class EventsController < ApplicationController
  before_action :find_user

  def index
  end

  def new
    @event = Event.new
  end

  private

  def find_user
    @user = current_user if logged_in?
  end
end
