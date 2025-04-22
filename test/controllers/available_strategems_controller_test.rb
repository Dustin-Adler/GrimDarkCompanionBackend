require "test_helper"

class AvailableStrategemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @available_strategem = available_strategems(:one)
  end

  test "should get index" do
    get available_strategems_url
    assert_response :success
  end

  test "should get new" do
    get new_available_strategem_url
    assert_response :success
  end

  test "should create available_strategem" do
    assert_difference("AvailableStrategem.count") do
      post available_strategems_url, params: { available_strategem: { model_id: @available_strategem.model_id, strategem_id: @available_strategem.strategem_id } }
    end

    assert_redirected_to available_strategem_url(AvailableStrategem.last)
  end

  test "should show available_strategem" do
    get available_strategem_url(@available_strategem)
    assert_response :success
  end

  test "should get edit" do
    get edit_available_strategem_url(@available_strategem)
    assert_response :success
  end

  test "should update available_strategem" do
    patch available_strategem_url(@available_strategem), params: { available_strategem: { model_id: @available_strategem.model_id, strategem_id: @available_strategem.strategem_id } }
    assert_redirected_to available_strategem_url(@available_strategem)
  end

  test "should destroy available_strategem" do
    assert_difference("AvailableStrategem.count", -1) do
      delete available_strategem_url(@available_strategem)
    end

    assert_redirected_to available_strategems_url
  end
end
