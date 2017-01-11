class Group < ApplicationRecord
  has_many :group_needs
  has_many :needs, through: :group_needs
  has_many :memberships
  has_many :users, through: :memberships

  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment :photo,
  content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
  
  def is_open?
    !!open
  end

  def set_admin(user)
    if is_member?( user )
      membership = Membership.where(user_id: user.id, group_id: id ).first
      membership.admin = true
      membership.save
    else
      membership = Membership.new
      membership.user = user
      membership.group = self
      membership.admin = true
      membership.save
    end
  end

  def remove_admin(user)
    membership = Membership.where(user_id: user.id, group_id: id )
    membership.admin = false
    membership.save
  end

  def members
    self.users
  end

  def is_member?(user)
    self.users.include?(user)
  end

  def not_member?(user)
    !self.users.include?(user)
  end

  def member_count
    self.users.count
  end

  def admins
    admins_membership = Membership.where(group_id: id, admin: true)
    admins_membership.collect { |membership| membership.user}
  end

end
