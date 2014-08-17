require 'pp'
class User < ActiveRecord::Base
  has_many :notes
  has_many :searches

  validates :email, :presence => true,
      :length => {:maximum => 55}

  validates_uniqueness_of :email

  validates :password, :presence => true,
      :length => {:minimum => 5},
      on: :create

  has_secure_password

end
