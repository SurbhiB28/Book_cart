require "test_helper"

class CrewControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get crew_index_url
    assert_response :success
  end
end
