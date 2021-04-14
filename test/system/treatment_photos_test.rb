require "application_system_test_case"

class TreatmentPhotosTest < ApplicationSystemTestCase
  setup do
    @treatment_photo = treatment_photos(:one)
  end

  test "visiting the index" do
    visit treatment_photos_url
    assert_selector "h1", text: "Treatment Photos"
  end

  test "creating a Treatment photo" do
    visit treatment_photos_url
    click_on "New Treatment Photo"

    click_on "Create Treatment photo"

    assert_text "Treatment photo was successfully created"
    click_on "Back"
  end

  test "updating a Treatment photo" do
    visit treatment_photos_url
    click_on "Edit", match: :first

    click_on "Update Treatment photo"

    assert_text "Treatment photo was successfully updated"
    click_on "Back"
  end

  test "destroying a Treatment photo" do
    visit treatment_photos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Treatment photo was successfully destroyed"
  end
end
