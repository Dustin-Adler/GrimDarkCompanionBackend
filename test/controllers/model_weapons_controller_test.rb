require "test_helper"

class ModelWeaponsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @model_weapon = model_weapons(:one)
  end

  test "should get index" do
    get model_weapons_url
    assert_response :success
  end

  test "should get new" do
    get new_model_weapon_url
    assert_response :success
  end

  test "should create model_weapon" do
    assert_difference("ModelWeapon.count") do
      post model_weapons_url, params: { model_weapon: { model_id: @model_weapon.model_id, weapon_id: @model_weapon.weapon_id } }
    end

    assert_redirected_to model_weapon_url(ModelWeapon.last)
  end

  test "should show model_weapon" do
    get model_weapon_url(@model_weapon)
    assert_response :success
  end

  test "should get edit" do
    get edit_model_weapon_url(@model_weapon)
    assert_response :success
  end

  test "should update model_weapon" do
    patch model_weapon_url(@model_weapon), params: { model_weapon: { model_id: @model_weapon.model_id, weapon_id: @model_weapon.weapon_id } }
    assert_redirected_to model_weapon_url(@model_weapon)
  end

  test "should destroy model_weapon" do
    assert_difference("ModelWeapon.count", -1) do
      delete model_weapon_url(@model_weapon)
    end

    assert_redirected_to model_weapons_url
  end
end
