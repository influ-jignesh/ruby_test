require 'test_helper'

class CreateBlogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @create_blog = create_blogs(:one)
  end

  test "should get index" do
    get create_blogs_url
    assert_response :success
  end

  test "should get new" do
    get new_create_blog_url
    assert_response :success
  end

  test "should create create_blog" do
    assert_difference('CreateBlog.count') do
      post create_blogs_url, params: { create_blog: {  } }
    end

    assert_redirected_to create_blog_url(CreateBlog.last)
  end

  test "should show create_blog" do
    get create_blog_url(@create_blog)
    assert_response :success
  end

  test "should get edit" do
    get edit_create_blog_url(@create_blog)
    assert_response :success
  end

  test "should update create_blog" do
    patch create_blog_url(@create_blog), params: { create_blog: {  } }
    assert_redirected_to create_blog_url(@create_blog)
  end

  test "should destroy create_blog" do
    assert_difference('CreateBlog.count', -1) do
      delete create_blog_url(@create_blog)
    end

    assert_redirected_to create_blogs_url
  end
end
