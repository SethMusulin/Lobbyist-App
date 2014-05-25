
class User < ActiveRecord::Base
  has_many :notes

  validates :email, :presence => true,
             :length => {:maximum => 55}
  validates_uniqueness_of :email
  validates :password, :presence => true,
            :length => {:minimum => 5}
  has_secure_password
end
