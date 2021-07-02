require "test_helper"

class BlogtextsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get blogtexts_new_url
    assert_response :success
  end
end
