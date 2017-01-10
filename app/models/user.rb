class User < ApplicationRecord
  has_secure_password
  has_many :needs
  has_many :replies
  has_many :hookups
  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true
  

end
