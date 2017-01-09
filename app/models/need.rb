class Need < ApplicationRecord
  belongs_to :user
  has_many :replies
  has_many :hookups
  validates :headline, presence: true, length: { maximum: 140}

  def self.mine_and_theirs(current_user)
    needs = all.partition do |user|
      user.id == current_user.to_i
    end

    { my_needs => needs[0],
      others_needs => needs[1]}
  end

end