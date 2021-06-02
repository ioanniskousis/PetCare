require "application_system_test_case"

class FoundsTest < ApplicationSystemTestCase
  setup do
    @found = founds(:one)
  end

  test "visiting the index" do
    visit founds_url
    assert_selector "h1", text: "Founds"
  end

  test "creating a Found" do
    visit founds_url
    click_on "New Found"

    fill_in "Comments", with: @found.comments
    check "Resolved" if @found.resolved
    fill_in "User", with: @found.user_id
    click_on "Create Found"

    assert_text "Found was successfully created"
    click_on "Back"
  end

  test "updating a Found" do
    visit founds_url
    click_on "Edit", match: :first

    fill_in "Comments", with: @found.comments
    check "Resolved" if @found.resolved
    fill_in "User", with: @found.user_id
    click_on "Update Found"

    assert_text "Found was successfully updated"
    click_on "Back"
  end

  test "destroying a Found" do
    visit founds_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Found was successfully destroyed"
  end
end
