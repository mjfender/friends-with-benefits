class User < ApplicationRecord
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "user_default.png"
  validates_attachment :avatar,
  content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
  has_secure_password
  has_many :needs, :dependent => :destroy
  has_many :replies, :dependent => :destroy
  has_many :event_users, :dependent => :destroy
  has_many :events, through: :event_users
  has_many :memberships, :dependent => :destroy
  has_many :groups, through: :memberships

  validates :name, presence: true
  validates :email, presence: true
  require 'date'
  
  def join_group(new_group)
    groups << new_group
    save
  end

  def display_name(current_user)
    if current_user.is_a? Integer
      id == current_user ? "You" : name
    else
      self == current_user ? "You" : name
    end
  end

  def update_login_history
    self.logins_count +=1
    self.logins_last = Date.current
    # change to Date.today after testing by hour
    #self.logins_last = Date.today
  end

end
