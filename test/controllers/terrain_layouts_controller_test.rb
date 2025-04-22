require "test_helper"

class TerrainLayoutsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @terrain_layout = terrain_layouts(:one)
  end

  test "should get index" do
    get terrain_layouts_url
    assert_response :success
  end

  test "should get new" do
    get new_terrain_layout_url
    assert_response :success
  end

  test "should create terrain_layout" do
    assert_difference("TerrainLayout.count") do
      post terrain_layouts_url, params: { terrain_layout: { name: @terrain_layout.name } }
    end

    assert_redirected_to terrain_layout_url(TerrainLayout.last)
  end

  test "should show terrain_layout" do
    get terrain_layout_url(@terrain_layout)
    assert_response :success
  end

  test "should get edit" do
    get edit_terrain_layout_url(@terrain_layout)
    assert_response :success
  end

  test "should update terrain_layout" do
    patch terrain_layout_url(@terrain_layout), params: { terrain_layout: { name: @terrain_layout.name } }
    assert_redirected_to terrain_layout_url(@terrain_layout)
  end

  test "should destroy terrain_layout" do
    assert_difference("TerrainLayout.count", -1) do
      delete terrain_layout_url(@terrain_layout)
    end

    assert_redirected_to terrain_layouts_url
  end
end
