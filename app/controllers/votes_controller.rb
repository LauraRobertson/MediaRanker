class VotesController < ApplicationController

  def create
    vote = Vote.new(vote_params)
    voting_user = session[:username]

    if vote.save
      flash[:message] = "Successfully upvoted!"
    else
      if voting_user == nil
        flash[:message] = "You must be logged in to do that!"
      else
        flash[:message] = "Hey! You've already voted for that!"
      end
    end

    redirect_to works_path
  end

  private

  def vote_params
    params.permit(:work_id)
  end

end
