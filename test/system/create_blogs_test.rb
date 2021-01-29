require "application_system_test_case"

class CreateBlogsTest < ApplicationSystemTestCase
  setup do
    @create_blog = create_blogs(:one)
  end

  test "visiting the index" do
    visit create_blogs_url
    assert_selector "h1", text: "Create Blogs"
  end

  test "creating a Create blog" do
    visit create_blogs_url
    click_on "New Create Blog"

    click_on "Create Create blog"

    assert_text "Create blog was successfully created"
    click_on "Back"
  end

  test "updating a Create blog" do
    visit create_blogs_url
    click_on "Edit", match: :first

    click_on "Update Create blog"

    assert_text "Create blog was successfully updated"
    click_on "Back"
  end

  test "destroying a Create blog" do
    visit create_blogs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Create blog was successfully destroyed"
  end
end
