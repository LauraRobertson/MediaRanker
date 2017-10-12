require 'test_helper'

class WorksControllerTest < ActionDispatch::IntegrationTest
  describe "WorksController" do
    let(:gatsby) { works(:gatsby) }

    it "going to the home page is successful" do
      get root_path
      must_respond_with :success
    end

    it "going to the index page is successful" do
      get works_path
      must_respond_with :success
    end

    it "going to the add work page is successful" do
      get new_work_path
      must_respond_with :success
    end

    it "successfully deletes a work" do
      proc {(delete work_path(gatsby.id))}.must_change 'Work.count', -1
      must_respond_with :redirect
      must_redirect_to root_path
    end
  end

end
