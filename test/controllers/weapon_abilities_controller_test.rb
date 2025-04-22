require "test_helper"

class WeaponAbilitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @weapon_ability = weapon_abilities(:one)
  end

  test "should get index" do
    get weapon_abilities_url
    assert_response :success
  end

  test "should get new" do
    get new_weapon_ability_url
    assert_response :success
  end

  test "should create weapon_ability" do
    assert_difference("WeaponAbility.count") do
      post weapon_abilities_url, params: { weapon_ability: { ability_id: @weapon_ability.ability_id, weapon_id: @weapon_ability.weapon_id } }
    end

    assert_redirected_to weapon_ability_url(WeaponAbility.last)
  end

  test "should show weapon_ability" do
    get weapon_ability_url(@weapon_ability)
    assert_response :success
  end

  test "should get edit" do
    get edit_weapon_ability_url(@weapon_ability)
    assert_response :success
  end

  test "should update weapon_ability" do
    patch weapon_ability_url(@weapon_ability), params: { weapon_ability: { ability_id: @weapon_ability.ability_id, weapon_id: @weapon_ability.weapon_id } }
    assert_redirected_to weapon_ability_url(@weapon_ability)
  end

  test "should destroy weapon_ability" do
    assert_difference("WeaponAbility.count", -1) do
      delete weapon_ability_url(@weapon_ability)
    end

    assert_redirected_to weapon_abilities_url
  end
end
