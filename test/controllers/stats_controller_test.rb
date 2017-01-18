require 'test_helper'

class StatsControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get stats_home_url
    assert_response :success
  end

end
