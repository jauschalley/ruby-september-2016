require 'test_helper'

class NumbersControllerTest < ActionController::TestCase
  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get get" do
    get :get
    assert_response :success
  end

end
