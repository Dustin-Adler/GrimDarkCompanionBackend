require "application_system_test_case"

class ModelWeaponsTest < ApplicationSystemTestCase
  setup do
    @model_weapon = model_weapons(:one)
  end

  test "visiting the index" do
    visit model_weapons_url
    assert_selector "h1", text: "Model weapons"
  end

  test "should create model weapon" do
    visit model_weapons_url
    click_on "New model weapon"

    fill_in "Model", with: @model_weapon.model_id
    fill_in "Weapon", with: @model_weapon.weapon_id
    click_on "Create Model weapon"

    assert_text "Model weapon was successfully created"
    click_on "Back"
  end

  test "should update Model weapon" do
    visit model_weapon_url(@model_weapon)
    click_on "Edit this model weapon", match: :first

    fill_in "Model", with: @model_weapon.model_id
    fill_in "Weapon", with: @model_weapon.weapon_id
    click_on "Update Model weapon"

    assert_text "Model weapon was successfully updated"
    click_on "Back"
  end

  test "should destroy Model weapon" do
    visit model_weapon_url(@model_weapon)
    click_on "Destroy this model weapon", match: :first

    assert_text "Model weapon was successfully destroyed"
  end
end
