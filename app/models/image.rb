class Image < ActiveRecord::Base
  belongs_to :user
  has_many :votes,  :dependent => :destroy
  
  def self.random
    current_user_session = UserSession.find
    @current_user = current_user_session && current_user_session.user
    if @current_user
      ids = connection.select_all("SELECT id FROM images WHERE user_id != #{@current_user.id}")
    else
      ids = connection.select_all("SELECT id FROM images")
    end
    find(ids[rand(ids.length)]["id"].to_i) unless ids.blank?
  end
end
