require 'test_helper'

class ChallengeSubscriptionsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get challenge_subscriptions_create_url
    assert_response :success
  end

end
