require "application_system_test_case"

class WeaponsTest < ApplicationSystemTestCase
  setup do
    @weapon = weapons(:one)
  end

  test "visiting the index" do
    visit weapons_url
    assert_selector "h1", text: "Weapons"
  end

  test "should create weapon" do
    visit weapons_url
    click_on "New weapon"

    fill_in "Attacks", with: @weapon.attacks
    fill_in "Damage", with: @weapon.damage
    fill_in "Id", with: @weapon.id
    check "Meelee" if @weapon.meelee
    fill_in "Name", with: @weapon.name
    fill_in "Proficiency", with: @weapon.proficiency
    fill_in "Range", with: @weapon.range
    fill_in "Strength", with: @weapon.strength
    click_on "Create Weapon"

    assert_text "Weapon was successfully created"
    click_on "Back"
  end

  test "should update Weapon" do
    visit weapon_url(@weapon)
    click_on "Edit this weapon", match: :first

    fill_in "Attacks", with: @weapon.attacks
    fill_in "Damage", with: @weapon.damage
    fill_in "Id", with: @weapon.id
    check "Meelee" if @weapon.meelee
    fill_in "Name", with: @weapon.name
    fill_in "Proficiency", with: @weapon.proficiency
    fill_in "Range", with: @weapon.range
    fill_in "Strength", with: @weapon.strength
    click_on "Update Weapon"

    assert_text "Weapon was successfully updated"
    click_on "Back"
  end

  test "should destroy Weapon" do
    visit weapon_url(@weapon)
    click_on "Destroy this weapon", match: :first

    assert_text "Weapon was successfully destroyed"
  end
end
