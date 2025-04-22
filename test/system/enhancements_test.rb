require "application_system_test_case"

class EnhancementsTest < ApplicationSystemTestCase
  setup do
    @enhancement = enhancements(:one)
  end

  test "visiting the index" do
    visit enhancements_url
    assert_selector "h1", text: "Enhancements"
  end

  test "should create enhancement" do
    visit enhancements_url
    click_on "New enhancement"

    fill_in "Cost", with: @enhancement.cost
    fill_in "Description", with: @enhancement.description
    fill_in "Detachment", with: @enhancement.detachment_id
    fill_in "Id", with: @enhancement.id
    fill_in "Name", with: @enhancement.name
    fill_in "Rule", with: @enhancement.rule
    click_on "Create Enhancement"

    assert_text "Enhancement was successfully created"
    click_on "Back"
  end

  test "should update Enhancement" do
    visit enhancement_url(@enhancement)
    click_on "Edit this enhancement", match: :first

    fill_in "Cost", with: @enhancement.cost
    fill_in "Description", with: @enhancement.description
    fill_in "Detachment", with: @enhancement.detachment_id
    fill_in "Id", with: @enhancement.id
    fill_in "Name", with: @enhancement.name
    fill_in "Rule", with: @enhancement.rule
    click_on "Update Enhancement"

    assert_text "Enhancement was successfully updated"
    click_on "Back"
  end

  test "should destroy Enhancement" do
    visit enhancement_url(@enhancement)
    click_on "Destroy this enhancement", match: :first

    assert_text "Enhancement was successfully destroyed"
  end
end
