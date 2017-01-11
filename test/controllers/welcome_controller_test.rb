require 'test_helper'

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  test "should get health-check" do
    get welcome_health_check_url
    assert_response :success
  end

end
