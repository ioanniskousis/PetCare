require "application_system_test_case"

class LostsTest < ApplicationSystemTestCase
  setup do
    @lost = losts(:one)
  end

  test "visiting the index" do
    visit losts_url
    assert_selector "h1", text: "Losts"
  end

  test "creating a Lost" do
    visit losts_url
    click_on "New Lost"

    fill_in "Comments", with: @lost.comments
    check "Resolved" if @lost.resolved
    fill_in "User", with: @lost.user_id
    click_on "Create Lost"

    assert_text "Lost was successfully created"
    click_on "Back"
  end

  test "updating a Lost" do
    visit losts_url
    click_on "Edit", match: :first

    fill_in "Comments", with: @lost.comments
    check "Resolved" if @lost.resolved
    fill_in "User", with: @lost.user_id
    click_on "Update Lost"

    assert_text "Lost was successfully updated"
    click_on "Back"
  end

  test "destroying a Lost" do
    visit losts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Lost was successfully destroyed"
  end
end
