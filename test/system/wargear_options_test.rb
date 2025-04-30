require "application_system_test_case"

class WargearOptionsTest < ApplicationSystemTestCase
  setup do
    @wargear_option = wargear_options(:one)
  end

  test "visiting the index" do
    visit wargear_options_url
    assert_selector "h1", text: "Wargear options"
  end

  test "should create wargear option" do
    visit wargear_options_url
    click_on "New wargear option"

    fill_in "Add to model", with: @wargear_option.add_to_model
    fill_in "For n models", with: @wargear_option.for_n_models
    fill_in "Model", with: @wargear_option.model_id
    fill_in "N models weapon swap", with: @wargear_option.n_models_weapon_swap
    fill_in "Weapon swaps", with: @wargear_option.weapon_swaps
    click_on "Create Wargear option"

    assert_text "Wargear option was successfully created"
    click_on "Back"
  end

  test "should update Wargear option" do
    visit wargear_option_url(@wargear_option)
    click_on "Edit this wargear option", match: :first

    fill_in "Add to model", with: @wargear_option.add_to_model
    fill_in "For n models", with: @wargear_option.for_n_models
    fill_in "Model", with: @wargear_option.model_id
    fill_in "N models weapon swap", with: @wargear_option.n_models_weapon_swap
    fill_in "Weapon swaps", with: @wargear_option.weapon_swaps
    click_on "Update Wargear option"

    assert_text "Wargear option was successfully updated"
    click_on "Back"
  end

  test "should destroy Wargear option" do
    visit wargear_option_url(@wargear_option)
    click_on "Destroy this wargear option", match: :first

    assert_text "Wargear option was successfully destroyed"
  end
end
