require "test_helper"

describe UsersController do
  let(:user1) { users(:user1) }

  describe "view pages work" do
    it "goes to the index users page" do
      get users_path
      must_respond_with :success
    end

    it "goes to the show users page" do
      get user_path(user1.id)
      must_respond_with :success
    end

    it "goes to the login form page" do
      get login_path
      must_respond_with :success
    end
  end

  describe "a user can have an account" do
    it "a user can re-login" do
      proc { post login_path, params: {username: "rainbow"}}.must_change 'User.count', 0
      must_respond_with :redirect
      must_redirect_to root_path
      flash[:success].must_equal "rainbow is successfully logged in"
    end

    it "can add a new user" do
      proc { post login_path, params: { username: "mnajk"}}.must_change 'User.count', 1
      must_respond_with :redirect
      must_redirect_to users_path
      flash[:success].must_equal "Successfully created new user mnajk with ID 206669144"
    end
  end

  # describe "a user can log out" do
  # end
end
