require 'test_helper'

class WorksControllerTest < ActionDispatch::IntegrationTest
  describe "WorksController" do
    let(:gatsby) { works(:gatsby) }

    it "successfully deletes a work" do
      proc {(delete work_path(gatsby.id))}.must_change 'Work.count', -1
      must_respond_with :redirect
      must_redirect_to root_path
    end
  end

end
