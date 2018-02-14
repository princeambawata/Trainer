require 'test_helper'

class CoachProfileControllerTest < ActionDispatch::IntegrationTest
  test "should get profile" do
    get coach_profile_profile_url
    assert_response :success
  end

end
