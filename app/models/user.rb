class User < ActiveRecord::Base
  acts_as_authentic
  has_many :images, :dependent => :destroy
  has_many :votes,  :dependent => :destroy
end