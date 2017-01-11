class Event < ApplicationRecord
  belongs_to :need
  has_many :event_users
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
    self.time.strftime("%I:%M%p on %B %d, %Y")
  end


end
