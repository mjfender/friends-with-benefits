class Reply < ApplicationRecord
  belongs_to :human
  belongs_to :need
  validates :yes, presence: true, unless: :comment
  validates :comment, presence: true, unless: :yes
  
end