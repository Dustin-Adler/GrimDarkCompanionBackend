require "test_helper"

class WargearOptionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @wargear_option = wargear_options(:one)
  end

  test "should get index" do
    get wargear_options_url
    assert_response :success
  end

  test "should get new" do
    get new_wargear_option_url
    assert_response :success
  end

  test "should create wargear_option" do
    assert_difference("WargearOption.count") do
      post wargear_options_url, params: { wargear_option: { add_to_model: @wargear_option.add_to_model, for_n_models: @wargear_option.for_n_models, model_id: @wargear_option.model_id, n_models_weapon_swap: @wargear_option.n_models_weapon_swap, weapon_swaps: @wargear_option.weapon_swaps } }
    end

    assert_redirected_to wargear_option_url(WargearOption.last)
  end

  test "should show wargear_option" do
    get wargear_option_url(@wargear_option)
    assert_response :success
  end

  test "should get edit" do
    get edit_wargear_option_url(@wargear_option)
    assert_response :success
  end

  test "should update wargear_option" do
    patch wargear_option_url(@wargear_option), params: { wargear_option: { add_to_model: @wargear_option.add_to_model, for_n_models: @wargear_option.for_n_models, model_id: @wargear_option.model_id, n_models_weapon_swap: @wargear_option.n_models_weapon_swap, weapon_swaps: @wargear_option.weapon_swaps } }
    assert_redirected_to wargear_option_url(@wargear_option)
  end

  test "should destroy wargear_option" do
    assert_difference("WargearOption.count", -1) do
      delete wargear_option_url(@wargear_option)
    end

    assert_redirected_to wargear_options_url
  end
end
