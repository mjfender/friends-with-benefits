class Reply < ApplicationRecord
  belongs_to :user
  belongs_to :need
  validates :yes, presence: true, unless: :comment
  validates :comment, presence: true, unless: :yes

  def add_to_event
    unless self.need.events.blank?
      @event = self.need.events.first
      EventUser.create(user_id: self.user_id, event_id: @event.id)
    end
  end

end
