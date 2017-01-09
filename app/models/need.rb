class Need < ApplicationRecord
  belongs_to :human
  has_many :replies
  has_many :hookups
  validates :headline, presence: true, length: { maximum: 140}
end