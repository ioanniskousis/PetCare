require "application_system_test_case"

class AppointmentsTest < ApplicationSystemTestCase
  setup do
    @appointment = appointments(:one)
  end

  test "visiting the index" do
    visit appointments_url
    assert_selector "h1", text: "Appointments"
  end

  test "creating a Appointment" do
    visit appointments_url
    click_on "New Appointment"

    fill_in "Content", with: @appointment.content
    fill_in "Datetime", with: @appointment.datetime
    check "Done" if @appointment.done
    fill_in "Location", with: @appointment.location
    fill_in "Title", with: @appointment.title
    fill_in "User", with: @appointment.user_id
    click_on "Create Appointment"

    assert_text "Appointment was successfully created"
    click_on "Back"
  end

  test "updating a Appointment" do
    visit appointments_url
    click_on "Edit", match: :first

    fill_in "Content", with: @appointment.content
    fill_in "Datetime", with: @appointment.datetime
    check "Done" if @appointment.done
    fill_in "Location", with: @appointment.location
    fill_in "Title", with: @appointment.title
    fill_in "User", with: @appointment.user_id
    click_on "Update Appointment"

    assert_text "Appointment was successfully updated"
    click_on "Back"
  end

  test "destroying a Appointment" do
    visit appointments_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Appointment was successfully destroyed"
  end
end
