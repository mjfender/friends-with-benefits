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
    # i think this is a cool idea
    # however, i also think you should break these out into two different
    # methods that you'd call in the controller and pass to the view.
  end

  def participants
    user_ids = Reply.where(need_id: id, yes: true).pluck(:user_id).uniq
    User.find(user_ids)
  end

  def replies
    # isn't this a has_many relationship? 
    # may conflict with the association you've set up above.
    # so perhaps renaming this and doing a query like
    # self.replies.where.not(comment: nil) could work
    Reply.where(need_id: id).where.not(comment: nil)
  end

  def owner?(current_user)
    user == current_user
  end

  def admin?(opt)
    opt[:controller] == "groups" && Group.find(opt[:id]).admin?(opt[:user])
    # this method is a little unclear to me
  end



end
