require "application_system_test_case"

class LostPhotosTest < ApplicationSystemTestCase
  setup do
    @lost_photo = lost_photos(:one)
  end

  test "visiting the index" do
    visit lost_photos_url
    assert_selector "h1", text: "Lost Photos"
  end

  test "creating a Lost photo" do
    visit lost_photos_url
    click_on "New Lost Photo"

    click_on "Create Lost photo"

    assert_text "Lost photo was successfully created"
    click_on "Back"
  end

  test "updating a Lost photo" do
    visit lost_photos_url
    click_on "Edit", match: :first

    click_on "Update Lost photo"

    assert_text "Lost photo was successfully updated"
    click_on "Back"
  end

  test "destroying a Lost photo" do
    visit lost_photos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Lost photo was successfully destroyed"
  end
end
