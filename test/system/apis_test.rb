require "application_system_test_case"

class ApisTest < ApplicationSystemTestCase
  setup do
    @api = apis(:one)
  end

  test "visiting the index" do
    visit apis_url
    assert_selector "h1", text: "Apis"
  end

  test "creating a Api" do
    visit apis_url
    click_on "New Api"

    fill_in "Hash", with: @api.hash
    fill_in "Host", with: @api.host
    fill_in "Listing", with: @api.listing
    fill_in "Location", with: @api.location
    fill_in "Path", with: @api.path
    click_on "Create Api"

    assert_text "Api was successfully created"
    click_on "Back"
  end

  test "updating a Api" do
    visit apis_url
    click_on "Edit", match: :first

    fill_in "Hash", with: @api.hash
    fill_in "Host", with: @api.host
    fill_in "Listing", with: @api.listing
    fill_in "Location", with: @api.location
    fill_in "Path", with: @api.path
    click_on "Update Api"

    assert_text "Api was successfully updated"
    click_on "Back"
  end

  test "destroying a Api" do
    visit apis_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Api was successfully destroyed"
  end
end
