require "application_system_test_case"

class ArmiesTest < ApplicationSystemTestCase
  setup do
    @army = armies(:one)
  end

  test "visiting the index" do
    visit armies_url
    assert_selector "h1", text: "Armies"
  end

  test "should create army" do
    visit armies_url
    click_on "New army"

    fill_in "Ability", with: @army.ability
    fill_in "Description", with: @army.description
    fill_in "Name", with: @army.name
    click_on "Create Army"

    assert_text "Army was successfully created"
    click_on "Back"
  end

  test "should update Army" do
    visit army_url(@army)
    click_on "Edit this army", match: :first

    fill_in "Ability", with: @army.ability
    fill_in "Description", with: @army.description
    fill_in "Name", with: @army.name
    click_on "Update Army"

    assert_text "Army was successfully updated"
    click_on "Back"
  end

  test "should destroy Army" do
    visit army_url(@army)
    click_on "Destroy this army", match: :first

    assert_text "Army was successfully destroyed"
  end
end
