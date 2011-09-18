class VotesController < ApplicationController
  
  def create    
    @vote = Vote.new(params[:vote])
    @vote.user = current_user unless current_user.nil?
    if @vote.save
      flash.now[:notice] = "Your vote has been saved."
    end
    redirect_back_or_default root_url
  end
  
  def update
    @vote = Vote.find(params[:id])
    @vote = Vote.update(params[:id], params[:vote])
    if @vote.update_attributes(params[:model])
      flash[:notice] = "Your vote has been saved."
    else
      flash[:error] = "There was a problem saving your vote."
    end
    redirect_to root_url
  end
end
