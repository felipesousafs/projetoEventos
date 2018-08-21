class WellcomeController < ApplicationController
  before_action :set_events, only: :index
  before_action :set_tags, only: :index
  before_action :set_event_types, only: :index

  def index
  end

  def dashboard_user
    @user = User.find(current_user.id)
    @events=@user.events
    @inscriptions=@user.inscriptions
  end

  def search_result
    @events = Event.filter(params.slice(:search_content))
  end

  def set_events
    @events = Event.all
  end

  def set_event_types
    @event_types = EventType.all
  end

  def set_tags
    @tags = ActsAsTaggableOn::Tag.all
  end

end
