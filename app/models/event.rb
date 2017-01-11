class Event < ApplicationRecord
  belongs_to :need
  has_many :event_users
  validates :time, :location, :description, presence: true
end
