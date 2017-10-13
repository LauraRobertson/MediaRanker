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
    # it "a user can re-login" do
    #   proc { post login_path, params: {user: {username: "rainbow"}}
    # }.must_change 'User.count', 0
    # must_respond_with :redirect
    # assert_equal "rainbow is successfully logged in", flash[:info]
    # end

    # it "can add a new user" do
    #   proc {
    #     post login_path, params: {user: { username: "A Username"}}
    #   }.must_change 'User.count', 1
    #   must_respond_with :redirect
    #   must_redirect_to root_path
    # end
  end

  describe "a user can log out" do

  end
end
