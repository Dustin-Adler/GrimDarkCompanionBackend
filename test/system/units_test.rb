require "application_system_test_case"

class UnitsTest < ApplicationSystemTestCase
  setup do
    @unit = units(:one)
  end

  test "visiting the index" do
    visit units_url
    assert_selector "h1", text: "Units"
  end

  test "should create unit" do
    visit units_url
    click_on "New unit"

    fill_in "Enhancement", with: @unit.enhancement_id
    fill_in "Leader one", with: @unit.leader_one_id
    fill_in "Leader two", with: @unit.leader_two_id
    fill_in "Name", with: @unit.name
    fill_in "Note", with: @unit.note
    fill_in "Squad", with: @unit.squad_id
    fill_in "Squad quantity", with: @unit.squad_quantity
    click_on "Create Unit"

    assert_text "Unit was successfully created"
    click_on "Back"
  end

  test "should update Unit" do
    visit unit_url(@unit)
    click_on "Edit this unit", match: :first

    fill_in "Enhancement", with: @unit.enhancement_id
    fill_in "Leader one", with: @unit.leader_one_id
    fill_in "Leader two", with: @unit.leader_two_id
    fill_in "Name", with: @unit.name
    fill_in "Note", with: @unit.note
    fill_in "Squad", with: @unit.squad_id
    fill_in "Squad quantity", with: @unit.squad_quantity
    click_on "Update Unit"

    assert_text "Unit was successfully updated"
    click_on "Back"
  end

  test "should destroy Unit" do
    visit unit_url(@unit)
    click_on "Destroy this unit", match: :first

    assert_text "Unit was successfully destroyed"
  end
end
