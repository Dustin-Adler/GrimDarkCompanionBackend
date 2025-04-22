require "test_helper"

class StrategemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @strategem = strategems(:one)
  end

  test "should get index" do
    get strategems_url
    assert_response :success
  end

  test "should get new" do
    get new_strategem_url
    assert_response :success
  end

  test "should create strategem" do
    assert_difference("Strategem.count") do
      post strategems_url, params: { strategem: { cost: @strategem.cost, detachment_id: @strategem.detachment_id, effect: @strategem.effect, id: @strategem.id, name: @strategem.name, restrictions: @strategem.restrictions, target: @strategem.target, when: @strategem.when } }
    end

    assert_redirected_to strategem_url(Strategem.last)
  end

  test "should show strategem" do
    get strategem_url(@strategem)
    assert_response :success
  end

  test "should get edit" do
    get edit_strategem_url(@strategem)
    assert_response :success
  end

  test "should update strategem" do
    patch strategem_url(@strategem), params: { strategem: { cost: @strategem.cost, detachment_id: @strategem.detachment_id, effect: @strategem.effect, id: @strategem.id, name: @strategem.name, restrictions: @strategem.restrictions, target: @strategem.target, when: @strategem.when } }
    assert_redirected_to strategem_url(@strategem)
  end

  test "should destroy strategem" do
    assert_difference("Strategem.count", -1) do
      delete strategem_url(@strategem)
    end

    assert_redirected_to strategems_url
  end
end
