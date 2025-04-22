require "test_helper"

class UnitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @unit = units(:one)
  end

  test "should get index" do
    get units_url
    assert_response :success
  end

  test "should get new" do
    get new_unit_url
    assert_response :success
  end

  test "should create unit" do
    assert_difference("Unit.count") do
      post units_url, params: { unit: { enhancement_id: @unit.enhancement_id, leader_one_id: @unit.leader_one_id, leader_two_id: @unit.leader_two_id, name: @unit.name, note: @unit.note, squad_id: @unit.squad_id, squad_quantity: @unit.squad_quantity } }
    end

    assert_redirected_to unit_url(Unit.last)
  end

  test "should show unit" do
    get unit_url(@unit)
    assert_response :success
  end

  test "should get edit" do
    get edit_unit_url(@unit)
    assert_response :success
  end

  test "should update unit" do
    patch unit_url(@unit), params: { unit: { enhancement_id: @unit.enhancement_id, leader_one_id: @unit.leader_one_id, leader_two_id: @unit.leader_two_id, name: @unit.name, note: @unit.note, squad_id: @unit.squad_id, squad_quantity: @unit.squad_quantity } }
    assert_redirected_to unit_url(@unit)
  end

  test "should destroy unit" do
    assert_difference("Unit.count", -1) do
      delete unit_url(@unit)
    end

    assert_redirected_to units_url
  end
end
