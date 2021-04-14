require "application_system_test_case"

class PetImagesTest < ApplicationSystemTestCase
  setup do
    @pet_image = pet_images(:one)
  end

  test "visiting the index" do
    visit pet_images_url
    assert_selector "h1", text: "Pet Images"
  end

  test "creating a Pet image" do
    visit pet_images_url
    click_on "New Pet Image"

    click_on "Create Pet image"

    assert_text "Pet image was successfully created"
    click_on "Back"
  end

  test "updating a Pet image" do
    visit pet_images_url
    click_on "Edit", match: :first

    click_on "Update Pet image"

    assert_text "Pet image was successfully updated"
    click_on "Back"
  end

  test "destroying a Pet image" do
    visit pet_images_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Pet image was successfully destroyed"
  end
end
