class User < ActiveRecord::Base
  acts_as_authentic do |c|
    c.maintain_sessions = false
  end
  
  has_many :images, :dependent => :destroy
  has_many :votes,  :dependent => :destroy
end