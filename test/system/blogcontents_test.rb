require "application_system_test_case"

class BlogcontentsTest < ApplicationSystemTestCase
  setup do
    @blogcontent = blogcontents(:one)
  end

  test "visiting the index" do
    visit blogcontents_url
    assert_selector "h1", text: "Blogcontents"
  end

  test "creating a Blogcontent" do
    visit blogcontents_url
    click_on "New Blogcontent"

    fill_in "Content", with: @blogcontent.content
    fill_in "User", with: @blogcontent.user_id
    click_on "Create Blogcontent"

    assert_text "Blogcontent was successfully created"
    click_on "Back"
  end

  test "updating a Blogcontent" do
    visit blogcontents_url
    click_on "Edit", match: :first

    fill_in "Content", with: @blogcontent.content
    fill_in "User", with: @blogcontent.user_id
    click_on "Update Blogcontent"

    assert_text "Blogcontent was successfully updated"
    click_on "Back"
  end

  test "destroying a Blogcontent" do
    visit blogcontents_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Blogcontent was successfully destroyed"
  end
end
