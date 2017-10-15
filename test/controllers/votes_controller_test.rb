require "test_helper"

describe VotesController do
  let(:user1) { users(:user1) }

  it "can create a vote" do
    # flash[:success].must_equal "Successfully upvoted!"
  end

  it "prevents multiple voting form the same user" do
    # flash[:error].must_equal "Hey! You've already voted for that!"
  end

  it "requires the user to be logged in to vote" do
    # flash[:error].must_equal "You must be logged in to do that!"
  end

  def session
    post login_path, params: {username: user1.username}
    session[:username].must_equal user1.id
  end
end
