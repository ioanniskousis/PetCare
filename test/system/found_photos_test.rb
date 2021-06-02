require "application_system_test_case"

class FoundPhotosTest < ApplicationSystemTestCase
  setup do
    @found_photo = found_photos(:one)
  end

  test "visiting the index" do
    visit found_photos_url
    assert_selector "h1", text: "Found Photos"
  end

  test "creating a Found photo" do
    visit found_photos_url
    click_on "New Found Photo"

    fill_in "Found", with: @found_photo.found_id
    click_on "Create Found photo"

    assert_text "Found photo was successfully created"
    click_on "Back"
  end

  test "updating a Found photo" do
    visit found_photos_url
    click_on "Edit", match: :first

    fill_in "Found", with: @found_photo.found_id
    click_on "Update Found photo"

    assert_text "Found photo was successfully updated"
    click_on "Back"
  end

  test "destroying a Found photo" do
    visit found_photos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Found photo was successfully destroyed"
  end
end
