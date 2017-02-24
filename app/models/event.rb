class Event < ApplicationRecord
  belongs_to :need
  has_many :event_users
  has_many :users, through: :event_users
  validates :time, :location, :description, presence: true


  def populate
    if self.need.replies
      #iterate through need's replies and add each reply's user to EventUsers
      self.need.replies.each do |reply|
        if reply.yes
          EventUser.create(user_id: reply.user.id, event_id: self.id)
        end
      end

    end
    #add need's owner to EventUsers
    EventUser.create(user_id: self.need.user.id, event_id: self.id)
  end

  def time_formatted
    # seems view specific...would probably drop it in helpers instead
    self.time.strftime("%I:%M%p on %B %d, %Y")
  end

  def self.upcoming_and_past(current_user_id)
    @me = User.find(current_user_id)
    my_events = @me.events.order(:time)
    hash = {}
    unless my_events.blank?
      past_and_present = my_events.partition do |event|
        event.time >= Time.now
      end

    hash = { :upcoming_events => past_and_present[0],
      :past_events => past_and_present[1].reverse }
    end
    hash
  end


end
