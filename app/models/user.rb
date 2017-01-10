class User < ApplicationRecord
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment :avatar,
  content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
  has_secure_password
  has_many :needs
  has_many :replies
  has_many :hookups
  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true
  

end
