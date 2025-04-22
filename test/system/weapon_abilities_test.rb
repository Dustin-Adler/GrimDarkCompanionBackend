require "application_system_test_case"

class WeaponAbilitiesTest < ApplicationSystemTestCase
  setup do
    @weapon_ability = weapon_abilities(:one)
  end

  test "visiting the index" do
    visit weapon_abilities_url
    assert_selector "h1", text: "Weapon abilities"
  end

  test "should create weapon ability" do
    visit weapon_abilities_url
    click_on "New weapon ability"

    fill_in "Ability", with: @weapon_ability.ability_id
    fill_in "Weapon", with: @weapon_ability.weapon_id
    click_on "Create Weapon ability"

    assert_text "Weapon ability was successfully created"
    click_on "Back"
  end

  test "should update Weapon ability" do
    visit weapon_ability_url(@weapon_ability)
    click_on "Edit this weapon ability", match: :first

    fill_in "Ability", with: @weapon_ability.ability_id
    fill_in "Weapon", with: @weapon_ability.weapon_id
    click_on "Update Weapon ability"

    assert_text "Weapon ability was successfully updated"
    click_on "Back"
  end

  test "should destroy Weapon ability" do
    visit weapon_ability_url(@weapon_ability)
    click_on "Destroy this weapon ability", match: :first

    assert_text "Weapon ability was successfully destroyed"
  end
end
