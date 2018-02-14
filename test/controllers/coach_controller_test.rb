require 'test_helper'

class CoachControllerTest < ActionDispatch::IntegrationTest
  test "should get signin" do
    get coach_signin_url
    assert_response :success
  end

  test "should get signup" do
    get coach_signup_url
    assert_response :success
  end

end
