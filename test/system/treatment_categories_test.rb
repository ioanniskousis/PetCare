require "application_system_test_case"

class TreatmentCategoriesTest < ApplicationSystemTestCase
  setup do
    @treatment_category = treatment_categories(:one)
  end

  test "visiting the index" do
    visit treatment_categories_url
    assert_selector "h1", text: "Treatment Categories"
  end

  test "creating a Treatment category" do
    visit treatment_categories_url
    click_on "New Treatment Category"

    fill_in "Categoryname", with: @treatment_category.categoryName
    fill_in "Parentcategory", with: @treatment_category.parentCategory
    click_on "Create Treatment category"

    assert_text "Treatment category was successfully created"
    click_on "Back"
  end

  test "updating a Treatment category" do
    visit treatment_categories_url
    click_on "Edit", match: :first

    fill_in "Categoryname", with: @treatment_category.categoryName
    fill_in "Parentcategory", with: @treatment_category.parentCategory
    click_on "Update Treatment category"

    assert_text "Treatment category was successfully updated"
    click_on "Back"
  end

  test "destroying a Treatment category" do
    visit treatment_categories_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Treatment category was successfully destroyed"
  end
end
