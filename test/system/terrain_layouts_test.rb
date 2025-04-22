require "application_system_test_case"

class TerrainLayoutsTest < ApplicationSystemTestCase
  setup do
    @terrain_layout = terrain_layouts(:one)
  end

  test "visiting the index" do
    visit terrain_layouts_url
    assert_selector "h1", text: "Terrain layouts"
  end

  test "should create terrain layout" do
    visit terrain_layouts_url
    click_on "New terrain layout"

    fill_in "Name", with: @terrain_layout.name
    click_on "Create Terrain layout"

    assert_text "Terrain layout was successfully created"
    click_on "Back"
  end

  test "should update Terrain layout" do
    visit terrain_layout_url(@terrain_layout)
    click_on "Edit this terrain layout", match: :first

    fill_in "Name", with: @terrain_layout.name
    click_on "Update Terrain layout"

    assert_text "Terrain layout was successfully updated"
    click_on "Back"
  end

  test "should destroy Terrain layout" do
    visit terrain_layout_url(@terrain_layout)
    click_on "Destroy this terrain layout", match: :first

    assert_text "Terrain layout was successfully destroyed"
  end
end
