class Membership < ApplicationRecord
  belongs_to :group
  belongs_to :user
  
  def pending?
    request_invite.exists? &! approved.nil?
  end

  
end
