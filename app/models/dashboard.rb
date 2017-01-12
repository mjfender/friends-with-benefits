class Dashboard < ApplicationRecord
require 'date'

  def self.upcoming_events(days_in_future = 7)
    Event.where(time: (Date.today)...(Date.today + days_in_future))
  end

  def self.created_last_week(object)
    object.where(created_at: (Date.today - 7)...(Date.today + 1))
  end

  def self.group_by_memberships
    Group.order(memberships_count: :desc)
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
