require "application_system_test_case"

class StrategemsTest < ApplicationSystemTestCase
  setup do
    @strategem = strategems(:one)
  end

  test "visiting the index" do
    visit strategems_url
    assert_selector "h1", text: "Strategems"
  end

  test "should create strategem" do
    visit strategems_url
    click_on "New strategem"

    fill_in "Cost", with: @strategem.cost
    fill_in "Detachment", with: @strategem.detachment_id
    fill_in "Effect", with: @strategem.effect
    fill_in "Id", with: @strategem.id
    fill_in "Name", with: @strategem.name
    fill_in "Restrictions", with: @strategem.restrictions
    fill_in "Target", with: @strategem.target
    fill_in "When", with: @strategem.when
    click_on "Create Strategem"

    assert_text "Strategem was successfully created"
    click_on "Back"
  end

  test "should update Strategem" do
    visit strategem_url(@strategem)
    click_on "Edit this strategem", match: :first

    fill_in "Cost", with: @strategem.cost
    fill_in "Detachment", with: @strategem.detachment_id
    fill_in "Effect", with: @strategem.effect
    fill_in "Id", with: @strategem.id
    fill_in "Name", with: @strategem.name
    fill_in "Restrictions", with: @strategem.restrictions
    fill_in "Target", with: @strategem.target
    fill_in "When", with: @strategem.when
    click_on "Update Strategem"

    assert_text "Strategem was successfully updated"
    click_on "Back"
  end

  test "should destroy Strategem" do
    visit strategem_url(@strategem)
    click_on "Destroy this strategem", match: :first

    assert_text "Strategem was successfully destroyed"
  end
end
