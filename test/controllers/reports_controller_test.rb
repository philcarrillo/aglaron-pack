require 'test_helper'

class ReportsControllerTest < ActionController::TestCase
  test "should get contact_reports" do
    get :contact_reports
    assert_response :success
  end

end
