require "test_helper"

class BlogcontentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @blogcontent = blogcontents(:one)
  end

  test "should get index" do
    get blogcontents_url
    assert_response :success
  end

  test "should get new" do
    get new_blogcontent_url
    assert_response :success
  end

  test "should create blogcontent" do
    assert_difference('Blogcontent.count') do
      post blogcontents_url, params: { blogcontent: { content: @blogcontent.content, user_id: @blogcontent.user_id } }
    end

    assert_redirected_to blogcontent_url(Blogcontent.last)
  end

  test "should show blogcontent" do
    get blogcontent_url(@blogcontent)
    assert_response :success
  end

  test "should get edit" do
    get edit_blogcontent_url(@blogcontent)
    assert_response :success
  end

  test "should update blogcontent" do
    patch blogcontent_url(@blogcontent), params: { blogcontent: { content: @blogcontent.content, user_id: @blogcontent.user_id } }
    assert_redirected_to blogcontent_url(@blogcontent)
  end

  test "should destroy blogcontent" do
    assert_difference('Blogcontent.count', -1) do
      delete blogcontent_url(@blogcontent)
    end

    assert_redirected_to blogcontents_url
  end
end
