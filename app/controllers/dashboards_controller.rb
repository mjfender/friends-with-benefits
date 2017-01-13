class DashboardsController < ApplicationController



  def index
    @upcoming_events = Dashboard.upcoming_events(7)
    @events_created_last_week = Dashboard.created_last_week(Event)
    @needs_created_last_week = Dashboard.created_last_week(Need)
    @replies_created_last_week = Dashboard.created_last_week(Reply)
    @group_by_memberships = Dashboard.group_by_memberships
    @needy_users = User.order(:needs_count)
    @helpful_users = Dashboard.helpful_users
    @users_last_week = Dashboard.users_active_last(7)
    @users_last_month = Dashboard.users_active_last(30)
    @inactive_users = Dashboard.inactive_users(30)
  end


end
