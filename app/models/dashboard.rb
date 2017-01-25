class Dashboard < ApplicationRecord
require 'date'
# Whoa this is really cool
# This is the essence of a view object or presenter in that you're using an
# object to encapsulate a lot of the complex logic you need for the view
#
# So in that sense, you should make another directory called presenters or
# view_objects and stick this file in there
# then, I would make all of these methods instance methods and instantiate a
# new dashboard to pass through to the view

# in the controller you could say something like @dashboard =
# Dashboard.new
#
# in the view, you could write
# @dashboard.upcoming_events
# @dashboard.created_last_week
# etc

# Also, because it's not a database-backed model, you don't need to inherit
# from ApplicationRecord

  def self.upcoming_events(days_in_future = 7)
    Event.where(time: (Date.today)...(Date.today + days_in_future))
  end

  def self.created_last_week(object)
    object.where(created_at: (Date.today - 7)...(Date.today + 1))
  end

  def self.group_by_memberships
    Group.order(memberships_count: :desc)
  end

  def self.helpful_users
    h = User.joins(:replies).group(:user_id).count
    sort = h.sort_by {|id, count| count}
    sort.reverse.map do |array|
      User.find(array[0])
    end
  end

  def self.users_active_last(days = 7)
    User.where("logins_last > ?", Date.current - days)
  end

  def self.inactive_users(days = 30)
    User.where("logins_last < ?", Date.current - days)
  end




end


# events this week - how many events this week and names

# who created the most events
# who replied to the most needs
# who created the most needs
# which needs expire this week and have no replies
# which needs have replies but don't have an associated events
# how many groups were created this week
# which groups have the most members
# which groups have the most needs assoc.
# which users are members of the most groups
# who is logging in the most
# how many active users do we have (users logged in this week)
# how many users are dormant (haven't loggged in in over a month)
