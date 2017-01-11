class Membership < ApplicationRecord
  belongs_to :group
  belongs_to :user
  
  def is_pending?
    request_invite.exists? &! approved.nil?
  end
  
end
