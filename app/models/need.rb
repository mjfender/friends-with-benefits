class Need < ApplicationRecord
  belongs_to :user, :counter_cache => true
  has_many :replies
  has_many :events
  has_many :groups, through: :group_needs
  has_many :group_needs, dependent: :destroy
  validates :headline, presence: true, length: { maximum: 140}

  def self.mine_and_theirs(current_user_id)
    needs = all.partition do |need|
      need.user_id == current_user_id.to_i
    end
    { :my_needs => needs[0],
      :others_needs => needs[1]}
  end

  def participants
    user_ids = Reply.where(need_id: id, yes: true).pluck(:user_id).uniq
    User.find(user_ids)
  end

  def replies
    Reply.where(need_id: id).where.not(comment: nil)
  end

  def owner?(current_user)
    user == current_user
  end

  def admin?(opt)
    opt[:controller] == "groups" && Group.find(opt[:id]).admin?(opt[:user])
  end



end
