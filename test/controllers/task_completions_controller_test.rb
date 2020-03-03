require 'test_helper'

class TaskCompletionsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get task_completions_create_url
    assert_response :success
  end

end
