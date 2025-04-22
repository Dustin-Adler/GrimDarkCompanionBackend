require "application_system_test_case"

class DetachmentsTest < ApplicationSystemTestCase
  setup do
    @detachment = detachments(:one)
  end

  test "visiting the index" do
    visit detachments_url
    assert_selector "h1", text: "Detachments"
  end

  test "should create detachment" do
    visit detachments_url
    click_on "New detachment"

    fill_in "Army", with: @detachment.army_id
    fill_in "Description", with: @detachment.description
    fill_in "Name", with: @detachment.name
    click_on "Create Detachment"

    assert_text "Detachment was successfully created"
    click_on "Back"
  end

  test "should update Detachment" do
    visit detachment_url(@detachment)
    click_on "Edit this detachment", match: :first

    fill_in "Army", with: @detachment.army_id
    fill_in "Description", with: @detachment.description
    fill_in "Name", with: @detachment.name
    click_on "Update Detachment"

    assert_text "Detachment was successfully updated"
    click_on "Back"
  end

  test "should destroy Detachment" do
    visit detachment_url(@detachment)
    click_on "Destroy this detachment", match: :first

    assert_text "Detachment was successfully destroyed"
  end
end
