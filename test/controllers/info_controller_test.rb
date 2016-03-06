require 'test_helper'

class InfoControllerTest < ActionController::TestCase
  test "should get contact" do
    get :contact
    assert_response :success
  end

  test "should get history" do
    get :history
    assert_response :success
  end

  test "should get services" do
    get :services
    assert_response :success
  end

  test "should get procurement" do
    get :procurement
    assert_response :success
  end

  test "should get packaging" do
    get :packaging
    assert_response :success
  end

end
