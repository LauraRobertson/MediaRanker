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

  describe "a user can create a new account" do

  end

  describe "a user can re-login" do

  end

  describe "a user can log out" do

  end
end
