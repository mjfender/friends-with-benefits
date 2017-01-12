class DashboardsController < ApplicationController

  

  def index
    @upcoming_events = Dashboard.upcoming_events(7)
    @events_created_last_week = Dashboard.created_last_week(Event)
    @needs_created_last_week = Dashboard.created_last_week(Need)
    @replies_created_last_week = Dashboard.created_last_week(Reply)
    @group_by_memberships = Dashboard.group_by_memberships
  end


end
