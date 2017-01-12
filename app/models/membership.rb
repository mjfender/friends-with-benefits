class Membership < ApplicationRecord
  belongs_to :group, :counter_cache => true
  belongs_to :user

  def pending?
    request_invite.exists? &! approved.nil?
  end

end
