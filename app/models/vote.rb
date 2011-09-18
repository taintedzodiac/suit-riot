class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :image
  
  def previous_score_for(vote_category)
    (self.send("#{vote_category}_score")).to_int
  end
end