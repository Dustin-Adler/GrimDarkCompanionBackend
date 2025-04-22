require "application_system_test_case"

class AvailableStrategemsTest < ApplicationSystemTestCase
  setup do
    @available_strategem = available_strategems(:one)
  end

  test "visiting the index" do
    visit available_strategems_url
    assert_selector "h1", text: "Available strategems"
  end

  test "should create available strategem" do
    visit available_strategems_url
    click_on "New available strategem"

    fill_in "Model", with: @available_strategem.model_id
    fill_in "Strategem", with: @available_strategem.strategem_id
    click_on "Create Available strategem"

    assert_text "Available strategem was successfully created"
    click_on "Back"
  end

  test "should update Available strategem" do
    visit available_strategem_url(@available_strategem)
    click_on "Edit this available strategem", match: :first

    fill_in "Model", with: @available_strategem.model_id
    fill_in "Strategem", with: @available_strategem.strategem_id
    click_on "Update Available strategem"

    assert_text "Available strategem was successfully updated"
    click_on "Back"
  end

  test "should destroy Available strategem" do
    visit available_strategem_url(@available_strategem)
    click_on "Destroy this available strategem", match: :first

    assert_text "Available strategem was successfully destroyed"
  end
end
